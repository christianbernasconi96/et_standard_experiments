# %%

import torch

# %%

base_path = '/home/remote_hdd/tokenized_datasets/figer/et_standard/'
# %%
dataset_name = 'bert-large-cased_M6L19R19T80_light/'

file_path = 'train/tokenized_sentences/input_ids/0.pt'

bert_tokenized = torch.load(base_path + dataset_name + file_path)
# %%

dataset_name = 'elmo_T80_SD10000_light/'

file_path = 'train/tokenized_sentences/mention_mask/0.pt'

elmo_tokenized = torch.load(base_path + dataset_name + file_path)

# %%

dataset_name = 'elmo_T80_SD10000_light/'

file_path = 'train/one_hot_types/0.pt'

one_hot_tokenized = torch.load(base_path + dataset_name + file_path)

# %%
