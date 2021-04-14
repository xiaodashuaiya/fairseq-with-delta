#!/bin/bash

TEXT=examples/translation/g2p

mkdir -p $TEXT
pushd $TEXT
bash ../../../run_prepare.sh
popd

fairseq-preprocess --source-lang de --target-lang en \
    --trainpref $TEXT/train --validpref $TEXT/valid --testpref $TEXT/test \
    --destdir data-bin/g2p.de-en


#mkdir -p checkpoints/fconv
#fairseq-train data-bin/g2p.de-en \
#   --lr 0.001 --clip-norm 0.1 --dropout 0.0 --max-tokens 4000 \
#   --arch lstm_wiseman_iwslt_de_en --save-dir checkpoints/lstm_3 --optimizer adam

mkdir -p checkpoints/lstm_new
fairseq-train data-bin/g2p.de-en \
   --lr 0.001 --clip-norm 0.1 --dropout 0.0 --max-tokens 4000 \
   --arch lstm --save-dir checkpoints/lstm_new --optimizer adam \
   --max-epoch 50

# mkdir -p checkpoints/fconv
# fairseq-train data-bin/g2p.de-en \
#     --lr 0.01 --clip-norm 0.1 --dropout 0.1 --max-tokens 8000 \
#     --arch fconv_iwslt_de_en --save-dir checkpoints/fconv --optimizer adam

# mkdir -p checkpoints/xformer1
# fairseq-train data-bin/g2p.de-en \
#     --lr 0.01 --clip-norm 0.1 --dropout 0.0 --max-tokens 4000 \
#     --arch transformer_iwslt_de_en --save-dir checkpoints/xformer1 --optimizer adam

#mkdir -p checkpoints/fconv_self_att
#fairseq-train data-bin/g2p.de-en \
#    --lr 0.001 --clip-norm 0.1 --dropout 0.0 --max-tokens 4000 \
#    --arch fconv_self_att --save-dir checkpoints/fconv_self_att --optimizer adam
