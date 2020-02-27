"""
Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the original array except the one at i.
Stretch - what if you can't use division?
"""
from operator import mul
from functools import reduce
# from pdb import pdb

def testTestTrue():
    return True

def testTestFalse():
    return False

def array_prod1(arr, i):
    return reduce(mul, arr) / arr[i]

def array_prod2(arr, i):
    return reduce(mul, [val for ind, val in enumerate(arr) if ind != i])

if __name__ == '__main__':
    print("=>{n}".format(n=array_prod2([1,2,3,4], 3)))
