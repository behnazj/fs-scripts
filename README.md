# fs-scripts
FreeSurferで解析をするために有用なスクリプトです

## fs_setup_6.0.sh
FreeSurfer6.0のインストールを支援するスクリプトです

## fs_check_6.0.sh
FreeSurfer6.0のインストールが正しく行われているか確認するスクリプトです

## fs_autorecon.sh
recon-allを複数のSubjectに対して行うスクリプトです
入力画像をniftiで受け付け、ファイル名をFreeSurferのSubject名と自動で設定します

## fs_volume.sh
FreeViewにて、SubjectのVolumeデータを確認するスクリプトです

## fs_surface.sh
FreeViewにて、SubjectのSurfaceデータを確認するスクリプトです

## fs_volsurf.sh
FreeViewにて、SubjectのVolumeデータ、Surfaceデータを一度に読み込んで確認するスクリプトです

## fs_asegstats.sh
皮質下volumeデータの統計値を表に書き出すスクリプトです

## fs_aparcstats.sh
皮質データの種々の統計値を表に書き出すスクリプトです

## fs_modify-recon-all.sh
recon-allはVirtualBoxなどを使う場合、共有フォルダにシンボリックリンクを作れないためにエラーとなります。この問題を解決するスクリプトです

## fs_qc1_skullstrip.sh
QCのためにskull-strippingを確認するためのスクリプトです。

## fs_qc2_aseg.sh
QCのために皮質下のsegmentationを確認するためのスクリプトです

## fs_qc3_wm.sh
QCのためにwm.mgzを確認するためのスクリプトです

## fs_qc4_pial.sh
QCのためにpial surfaceを確認するためのスクリプトです

