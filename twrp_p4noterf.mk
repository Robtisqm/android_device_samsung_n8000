name: OrangeFox - Build

on:
  workflow_dispatch:
    inputs:
      MANIFEST_BRANCH:
        description: 'OrangeFox Branch'
        required: true
        default: '12.1'
        type: choice
        options:
        - 14.1
        - 12.1
        - 11.0
      DEVICE_TREE:
        description: 'Custom Recovery Tree'
        required: true
        default: 'https://github.com/Robtisqm/android_device_samsung_n8000.git'
      DEVICE_TREE_BRANCH:
        description: 'Custom Recovery Tree Branch'
        required: true
        default: 'lineage-14.1'
      DEVICE_PATH:
        description: 'Specify your device path.'
        required: true
        default: 'device/samsung/p4noterf'
      DEVICE_NAME:
        description: 'Specify your Device Codename.'
        required: true
        default: 'p4noterf'
      BUILD_TARGET:
        description: 'Specify your Build Target'
        required: true
        default: 'recovery'
        type: choice
        options:
        - boot
        - recovery
        - vendorboot
      LDCHECK:
        description: 'Path of blobs to check'
        required: true
        default: 'system/bin/qseecomd'
      RECOVERY_TAR:
        description: 'Release recovery.tar For Samsung devices'
        required: false
        default: true
        type: boolean
      RECOVERY_INSTALLER:
        description: 'Include recovery installer zip'
        type: boolean
        required: true
        default: true

jobs:
  build:
    name: Build OFRP by ${{ github.actor }}
    runs-on: ubuntu-latest
    if: github.event.repository.owner.id == github.event.sender.id
    env:
      GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    permissions:
      contents: write

    steps:
    - name: Checkout
      uses: actions/checkout@v3

    - name: Clean-up
      uses: rokibhasansagar/slimhub_actions@main

    - name: Swap Space
      uses: pierotofy/set-swap-space@master
      with:
        swap-size-gb: 24

    - name: Build Environment
      run: |
        sudo apt update
        sudo apt -y upgrade
        git clone https://gitlab.com/OrangeFox/misc/scripts
        cd scripts
        sudo bash setup/android_build_env.sh

    - name: Set-up Manifest
      run: |
        mkdir -p ${GITHUB_WORKSPACE}/OrangeFox
        cd ${GITHUB_WORKSPACE}/OrangeFox
        git config --global user.name "OrangeFox Build"
        git config --global user.email "build@orangefox.com"
        git clone https://gitlab.com/OrangeFox/sync.git
        cd sync
        ./orangefox_sync.sh --branch ${{ github.event.inputs.MANIFEST_BRANCH }} --path ${GITHUB_WORKSPACE}/OrangeFox/fox_${{ github.event.inputs.MANIFEST_BRANCH }}

    - name: Clone Device Tree
      run: |
        cd ${GITHUB_WORKSPACE}/OrangeFox/fox_${{ github.event.inputs.MANIFEST_BRANCH }}
        git clone ${{ github.event.inputs.DEVICE_TREE }} -b ${{ github.event.inputs.DEVICE_TREE_BRANCH }} ./${{ github.event.inputs.DEVICE_PATH }}
        cd ./${{ github.event.inputs.DEVICE_PATH }}
        
        echo "COMMIT_ID=$(git rev-parse HEAD)" >> $GITHUB_ENV

        # === Специальные правки для GT-N8000 (p4noterf) ===
        echo "Применяем фиксы графики и темы..."
        
        # Заменяем mdpi на гарантированно существующую portrait_hdpi
        sed -i 's/TW_THEME := landscape_mdpi/TW_THEME := portrait_hdpi/g' BoardConfig.mk
        
        # Дописываем вертикальное разрешение экрана в конец файла
        echo "" >> BoardConfig.mk
        echo "# OrangeFox screen fixes" >> BoardConfig.mk
        echo "TARGET_SCREEN_WIDTH := 800" >> BoardConfig.mk
        echo "TARGET_SCREEN_HEIGHT := 1280" >> BoardConfig.mk

        # Копируем конфиг под omni_, чтобы lunch не спотыкался
        if [ -f twrp_p4noterf.mk ]; then
          cp twrp_p4noterf.mk omni_p4noterf.mk
          sed -i 's/twrp_/omni_/g' omni_p4noterf.mk
        fi

    - name: Building OrangeFox
      run: |
        cd ${GITHUB_WORKSPACE}/OrangeFox/fox_${{ github.event.inputs.MANIFEST_BRANCH }}
        set +e
        source build/envsetup.sh
        export ALLOW_MISSING_DEPENDENCIES=true
        set -e
        
        # Пробуем собрать через twrp, если не найдет — пойдет через omni
        lunch twrp_${{ github.event.inputs.DEVICE_NAME }}-eng && make clean && mka adbd ${{ github.event.inputs.BUILD_TARGET }}image || \
        lunch omni_${{ github.event.inputs.DEVICE_NAME }}-eng && make clean && mka ${{ github.event.inputs.BUILD_TARGET }}image

    - name: Set Build Date
      run: |
        echo "BUILD_DATE=$(date +%Y%m%d)" >> $GITHUB_ENV
        DEVICE_TREE_URL="${{ github.event.inputs.DEVICE_TREE }}"
        if [[ "${DEVICE_TREE_URL}" == *.git ]]; then
          DEVICE_TREE_URL="${DEVICE_TREE_URL%.git}"
        fi
        echo "DEVICE_TREE_URL=${DEVICE_TREE_URL}" >> $GITHUB_ENV

    - name: Check if Recovery Exist
      run: |
        cd ${GITHUB_WORKSPACE}/OrangeFox/fox_${{ github.event.inputs.MANIFEST_BRANCH }}
        if [ -f out/target/product/${{ github.event.inputs.DEVICE_NAME }}/OrangeFox*.img ]; then
            echo "CHECK_IMG_IS_OK=true" >> $GITHUB_ENV
            echo "FILE_PATH=${GITHUB_WORKSPACE}/OrangeFox/fox_${{ github.event.inputs.MANIFEST_BRANCH }}/out/target/product/${{ github.event.inputs.DEVICE_NAME }}" >> $GITHUB_ENV
        else
            echo "Recovery not found!"
            exit 1
        fi

    - name: Rename the Recovery
      run: |
        cd ${{ env.FILE_PATH }}/
        mv OrangeFox*.img recovery.img || true
        echo "RECOVERY_TYPE=recovery" >> $GITHUB_ENV

    - name: Recovery to tar for Samsung
      if: github.event.inputs.RECOVERY_TAR == 'true'
      run: |
        cd ${{ env.FILE_PATH }}/
        tar -cvf recovery.tar recovery.img

    - name: Upload to Release
      if: env.CHECK_IMG_IS_OK == 'true'
      uses: softprops/action-gh-release@v1
      with:
        files: |
          ${{ env.FILE_PATH }}/recovery.img
          ${{ env.FILE_PATH }}/recovery.tar
        name: Unofficial OrangeFox for p4noterf // ${{ env.BUILD_DATE }}
        tag_name: ${{ github.run_id }}
        body: |
          Branch: ${{ github.event.inputs.MANIFEST_BRANCH }}
          Device: GT-N8000 (p4noterf)
