# #!/bin/bash

# CMD='python'
# SEED=0
# while getopts "ds:" opt; do
#   case $opt in
#     d) CMD='debugpy-run -p :5680'
#     ;;
#     s) SEED=$OPTARG
#     ;;
#   esac
# done


# $CMD trainers/trainer_elmo_large.py fit \
# --seed_everything=$SEED \
# --data configs/et_standard/data/common_elmo.yaml \
# --data configs/et_standard/data/ontonotes_augmented_elmo_unlimited.yaml \
# --trainer configs/et_standard/trainer_common.yaml \
# --trainer.callbacks=ModelCheckpoint \
# --trainer.callbacks.dirpath=/home/remote_hdd/trained_models/ontonotes_augmented/et_standard \
# --trainer.callbacks.filename=classifier_elmo_mmc \
# --trainer.callbacks.monitor=val_loss \
# --trainer.callbacks.save_weights_only=True \
# --trainer.callbacks=EarlyStopping \
# --trainer.callbacks.patience=5 \
# --trainer.callbacks.monitor=val_loss \
# --trainer.callbacks.mode=min \
# --trainer.callbacks.verbose=True \
# --model configs/et_standard/model/common.yaml \
# --model configs/et_standard/model/classifier_elmo_mmc.yaml \
# --logger configs/logger.yaml \
# --logger.project=ontonotes_augmented_et_standard_elmo \
# --logger.name=classifier_elmo_mmc_unlimited