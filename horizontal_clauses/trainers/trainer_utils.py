from tqdm import tqdm
import numpy as np

def calibrate_threshold(trainer, step=.025):
  if trainer.model.inference_manager.calibrate_threshold:
      # compute patience as 10% of the total number of steps
      patience = int(1000 // (step*1000) * .1)
      counter = 0
      # disable validation metrics flag
      trainer.model.log_validation_metrics = False
      # iterate over thresholds and call validation routine
      max_f1 = 0
      max_t = 0
      for t in tqdm(np.arange(step, 1, step), desc='Calibrating the threshold'):
          print()
          print('Validating model with threshold set to', t)
          trainer.model.inference_manager.threshold = t
          trainer.model.trainer.validate(trainer.model.trainer.model, trainer.model.trainer.datamodule.val_dataloader())
          f1 = trainer.model.last_validation_metrics['dev/macro_example/f1']
          print()
          print('Macro example F1:', f1.item())
          if f1 > max_f1:
              print('Value improved')
              max_f1 = f1
              max_t = t
              counter = 0
          else:
              print('Value not improved')
              counter += 1
              # early stop
              if counter == patience:
                break
      # set optimal threshold
      trainer.model.inference_manager.threshold = max_t