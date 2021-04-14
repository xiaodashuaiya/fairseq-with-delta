def AddTwoDelta(i):
    #res = torch.cat((feature, delta, delta_2), -1)
    #final_feature = feature / delta / delta_2

    feature = i

    t1 = i[:, 0:1, :]
    shifted = torch.cat((t1, i), 1)
    shifted = shifted[:, :-1, :]
    delta = i - shifted

    shifted_1 = torch.cat((t1, t1, i), 1)
    shifted_1 = shifted_1[:, :-2, :]
    delta_2 = shifted - shifted_1

    res = torch.cat((i, delta, delta_2), -1)
    return res