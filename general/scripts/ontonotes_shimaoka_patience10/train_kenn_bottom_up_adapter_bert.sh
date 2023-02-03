#!/bin/bash

CMD='python'
SEED=0
while getopts "ds:" opt; do
  case $opt in
    d) CMD='debugpy-run -p :5680'
    ;;
    s) SEED=$OPTARG
    ;;
  esac
done


$CMD trainers/trainer_kenn_bert.py fit \
--seed_everything=$SEED \
--data configs/et_standard/data/common_bert.yaml \
--data configs/et_standard/data/ontonotes_shimaoka_bert.yaml \
--trainer configs/et_standard/trainer_common.yaml \
--trainer.callbacks=ModelCheckpoint \
--trainer.callbacks.dirpath=/home/remote_hdd/trained_models/ontonotes_shimaoka/et_standard \
--trainer.callbacks.filename=kenn_bottom_up_adapter_bert_patience10 \
--trainer.callbacks.monitor=val_loss \
--trainer.callbacks.save_weights_only=True \
--trainer.callbacks=EarlyStopping \
--trainer.callbacks.patience=10 \
--trainer.callbacks.monitor=val_loss \
--trainer.callbacks.mode=min \
--trainer.callbacks.verbose=True \
--model configs/et_standard/model/common.yaml \
--model configs/et_standard/model/kenn_common.yaml \
--model configs/et_standard/model/kenn_bottom_up_bert.yaml \
--logger configs/logger.yaml \
--logger.project=ontonotes_shimaoka_et_standard_elmo_patience10 \
--logger.name=kenn_bottom_up_adapter_bert