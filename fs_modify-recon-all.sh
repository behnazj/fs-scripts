#!/bin/bash
#modify recon-all so that symbolic link error will not happen.

echo "共有フォルダを使ってもrecon-allができるようにrecon-allスクリプトを修正します。"

while true; do

echo "修正をはじめていいですか? (yes/no)"
read answer 
    case $answer in
        [Yy]*)
          echo "修正をはじめます。パスワードを聞かれますので、lin4neuroとタイプしてください。"
	  echo "なお、タイプしても表示されません。"
          break
          ;;
        [Nn]*)
          echo "修正を中止します。"
          exit 1
          ;;
        *)
          echo -e "yes か no をタイプしてください \n"
          ;;
    esac
done

sudo sed -i 's/ln -s \$hemi/cp \$hemi/' /usr/local/freesurfer/bin/recon-all

echo "修正が完了しました。5秒後に自動でこのウィンドウが閉じます。"
sleep 5
exit

