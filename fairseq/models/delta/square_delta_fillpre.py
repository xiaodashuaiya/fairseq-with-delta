#  一个一阶delta,一个二阶delta，差值取1，用渐近线补空
import sklearn
import torch.tensor
from sklearn.linear_model import LinearRegression
import numpy as np


def Regression(i):
    i = i.numpy()
    

def AddSquareDeltaFillpre(i):
    #res = torch.cat((feature, delta, delta_2), -1)
    #final_feature = feature / delta / delta_2

    feature = i

    t1 = i[:, 0:1, :]
    shifted = torch.cat((t1, i), 1)
    shifted = shifted[:, :-1, :]
    delta = i - shifted

    t2 = delta[:, 0:1, :]
    shifted2 = torch.cat((t2, delta), 1)
    shifted2 = shifted2[:, :-1, :]
    delta2 = delta - shifted2

    res = torch.cat((i, delta, delta2), 1)
    return res
