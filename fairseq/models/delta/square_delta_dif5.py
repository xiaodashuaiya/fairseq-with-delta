#  一个一阶delta,一个二阶delta，差值取5，用t0填充空白
import torch.tensor
def AddSquareDelta(i):
    #res = torch.cat((feature, delta, delta_2), -1)
    #final_feature = feature / delta / delta_2

    feature = i

    t1 = i[:, 0:5, :]
    shifted = torch.cat((t1,t1,t1,t1,t1,i), 1)
    shifted = shifted[:, :-5, :]
    delta = i - shifted

    t2 = delta[:, 0:5, :]
    shifted2 = torch.cat((t2,t2,t2,t2,t2 ,delta), 1)
    shifted2 = shifted2[:, :-5, :]
    delta2 = delta - shifted2

    res = torch.cat((i, delta, delta2), 1)
    return res
