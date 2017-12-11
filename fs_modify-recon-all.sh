#!/bin/bash
#modify recon-all so that symbolic link error will not happen.
sudo sed -i 's/ln -s \$hemi/cp \$hemi/' /usr/local/freesurfer/bin/recon-all

