module Main where

import Numeric.Probability.Distribution
import System.Exit (exitFailure)

main :: IO ()
main = do
    let floatTestValues :: [(Char,Double)]
        floatTestValues = [('s', 2.66), ('F', 8.54), ('a', 8.97), ('n', 4.46), ('c', 2.89), ('s', 7.78), ('T', 8.44), ('h', 3.98), ('x', 4.25), ('D', 8.14), ('I', 5.25), ('g', 5.65), ('q', 5.94), ('c', 1.65), ('B', 7.01), ('h', 9.02), ('u', 5.05), ('q', 5.96), ('x', 5.12), ('w', 1.09), ('R', 0.14), ('r', 0.91), ('Y', 9.57), ('H', 0.21), ('J', 0.75), ('o', 5.33), ('F', 3.41), ('i', 7.08), ('Q', 3.39), ('H', 0.89), ('C', 2.71), ('p', 6.95), ('t', 7.84), ('v', 6.4), ('Q', 3.81), ('E', 6.49), ('z', 8.27), ('K', 8.31), ('s', 7.43), ('D', 0.24), ('a', 3.64), ('c', 1.05), ('E', 5.54), ('x', 3.11), ('Z', 2.86), ('w', 2.18), ('q', 7.09), ('s', 5.44), ('S', 1.86), ('y', 0.27), ('D', 2.89), ('J', 2.7), ('X', 3.38), ('l', 2.55), ('q', 9.35), ('d', 4.61), ('K', 4.86), ('u', 8.95), ('Y', 7.57), ('p', 2.59), ('v', 0.52), ('Q', 2.2), ('E', 4.87), ('X', 8.82), ('g', 4.01), ('m', 7.13), ('m', 3.45), ('u', 3.07), ('u', 5.34), ('W', 7.31), ('R', 8.28), ('h', 1.85), ('E', 4.65), ('c', 2.78), ('M', 8.51), ('N', 1.44), ('z', 2.13), ('R', 4.49), ('L', 0.25), ('v', 9.67), ('S', 2.27), ('l', 1.16), ('c', 2.16), ('t', 2.06), ('m', 1.37), ('Y', 7.39), ('I', 7.43), ('E', 2.34), ('u', 9.01), ('W', 1.9), ('X', 5.65), ('a', 2.54), ('h', 7.76), ('l', 1.03), ('W', 3.5), ('U', 7.53), ('a', 3.44), ('c', 1.05), ('U', 6.47), ('g', 3.0), ('q', 5.75), ('V', 9.34), ('A', 7.62), ('o', 1.06), ('L', 3.69), ('T', 4.74), ('G', 8.67), ('t', 4.16), ('J', 3.26), ('f', 9.42), ('R', 2.26), ('F', 3.06), ('J', 0.38), ('v', 4.76), ('o', 2.76), ('B', 1.41), ('m', 7.68), ('L', 7.97), ('p', 4.85), ('r', 5.09), ('t', 2.49), ('Q', 3.59), ('p', 5.76), ('H', 1.77), ('v', 0.46), ('w', 3.5), ('a', 0.92), ('z', 2.29), ('W', 5.45), ('F', 9.35), ('s', 0.95), ('a', 7.33), ('L', 6.83), ('G', 6.14), ('n', 2.24), ('E', 7.79), ('c', 7.36), ('u', 0.14), ('J', 1.6), ('K', 2.93), ('b', 6.39), ('s', 3.05), ('x', 7.34), ('K', 0.94), ('v', 9.22), ('D', 0.36), ('Z', 4.26), ('v', 1.78), ('M', 3.98), ('T', 9.91), ('C', 8.59), ('C', 1.71), ('W', 3.8), ('R', 2.63), ('b', 9.56), ('o', 9.42), ('n', 0.73), ('O', 9.31), ('o', 1.25), ('I', 9.47), ('A', 8.6), ('t', 1.64), ('Y', 9.9), ('C', 7.02), ('j', 9.62), ('k', 5.06), ('D', 7.74), ('j', 3.57), ('T', 1.84), ('F', 8.14), ('a', 7.98), ('a', 1.63), ('W', 0.07), ('O', 7.44), ('a', 3.2), ('k', 6.48), ('b', 4.88), ('S', 1.02), ('L', 9.49), ('S', 4.92), ('t', 3.84), ('S', 5.19), ('a', 2.51), ('B', 7.68), ('b', 9.05), ('g', 3.76), ('e', 9.93), ('G', 6.14), ('r', 2.58), ('o', 0.08), ('p', 0.37), ('p', 2.2), ('U', 9.81), ('B', 2.85), ('V', 7.22), ('d', 0.83), ('y', 7.93), ('Z', 3.52), ('x', 5.34), ('b', 3.63), ('S', 8.14), ('O', 8.31), ('u', 4.83), ('E', 4.01), ('V', 6.6), ('s', 6.55), ('B', 6.74), ('Z', 7.7), ('M', 2.37), ('s', 4.91), ('k', 7.42), ('m', 8.91), ('N', 1.33), ('h', 1.93), ('u', 1.76), ('l', 5.0), ('f', 2.13), ('V', 8.91), ('L', 9.8), ('A', 2.08), ('N', 0.68), ('b', 9.08), ('e', 3.94), ('j', 6.87), ('U', 2.87), ('T', 7.05), ('N', 0.7), ('X', 7.42), ('y', 1.32), ('K', 4.69), ('x', 9.69), ('C', 8.96), ('C', 3.54), ('M', 5.75), ('P', 0.78), ('s', 4.77), ('y', 9.15), ('A', 6.42), ('B', 4.44), ('O', 8.96), ('x', 4.83), ('b', 1.76), ('A', 2.69), ('O', 5.11), ('L', 0.66), ('i', 7.42), ('g', 0.62), ('z', 3.12), ('A', 4.31), ('b', 6.27), ('W', 5.46), ('G', 5.99), ('d', 9.62), ('Y', 9.2), ('Q', 3.98), ('g', 0.24), ('B', 9.69), ('E', 5.7), ('e', 6.07), ('J', 6.64), ('M', 3.29), ('X', 3.25), ('L', 7.91), ('P', 7.05), ('E', 4.6), ('b', 7.37), ('t', 0.03), ('R', 2.28), ('q', 2.65), ('g', 5.41), ('j', 8.9), ('Y', 1.74), ('Q', 0.03), ('b', 9.91), ('r', 3.44), ('i', 3.93), ('w', 8.54), ('m', 0.15), ('I', 1.12), ('d', 5.31), ('I', 1.33), ('R', 5.29), ('J', 7.31), ('D', 8.76), ('O', 6.17), ('K', 6.17), ('J', 5.69), ('Q', 5.92), ('n', 2.45), ('Q', 1.68), ('V', 8.94), ('E', 5.03), ('c', 5.51), ('t', 2.23), ('g', 9.71), ('R', 6.45), ('p', 0.26), ('t', 0.4), ('m', 0.68), ('p', 7.92), ('R', 2.52), ('n', 5.7), ('d', 9.75), ('s', 9.86), ('S', 2.13), ('r', 2.13), ('b', 2.0), ('F', 2.22), ('x', 3.19), ('h', 7.82), ('v', 0.22), ('E', 0.12), ('X', 3.23), ('P', 6.63), ('u', 6.37), ('U', 3.18), ('J', 2.98), ('L', 0.87), ('J', 9.17), ('s', 0.39), ('P', 2.78), ('F', 10.0), ('i', 2.62), ('p', 0.58), ('B', 6.92), ('Y', 8.8), ('F', 5.13), ('V', 9.5), ('E', 3.74), ('o', 6.37), ('j', 1.2), ('b', 4.28), ('E', 5.51), ('A', 5.56), ('y', 1.81), ('a', 3.86), ('z', 9.46), ('u', 4.89), ('W', 5.73), ('z', 7.44), ('F', 1.36), ('n', 1.88), ('Y', 5.76), ('y', 3.92), ('C', 5.98), ('O', 7.83), ('d', 6.83), ('a', 7.02), ('V', 5.77), ('L', 7.88), ('y', 9.65), ('u', 0.23), ('b', 7.37), ('U', 8.74), ('F', 8.88), ('d', 7.01), ('V', 0.82), ('o', 2.32), ('w', 7.58), ('t', 9.34), ('F', 6.0), ('d', 4.3), ('u', 6.18), ('M', 0.98), ('Q', 4.59), ('J', 7.15), ('n', 5.63), ('g', 9.95), ('a', 0.23), ('P', 7.36), ('W', 9.3), ('q', 4.97), ('h', 7.48), ('y', 1.02), ('f', 0.47), ('e', 2.87), ('h', 8.68), ('w', 0.24), ('V', 8.7), ('O', 4.15), ('G', 5.91), ('m', 8.98), ('v', 8.37), ('C', 2.96), ('f', 4.11), ('a', 6.23), ('B', 9.71), ('k', 2.0), ('O', 3.02), ('l', 3.51), ('S', 4.82), ('D', 3.21), ('f', 3.6), ('T', 1.79), ('m', 5.24), ('O', 5.23), ('N', 7.55), ('r', 7.25), ('Z', 8.52), ('s', 8.15), ('m', 8.36), ('s', 6.97), ('F', 7.49), ('Y', 9.49), ('M', 2.1), ('L', 3.94), ('o', 6.98), ('n', 5.22), ('E', 8.99), ('E', 2.82), ('h', 6.25), ('t', 0.63), ('F', 8.43), ('w', 3.47), ('i', 9.2), ('b', 9.98), ('H', 6.96), ('T', 5.92), ('w', 4.92), ('v', 6.09), ('v', 9.19), ('b', 4.41), ('V', 1.27), ('r', 0.97), ('m', 3.56), ('Q', 5.36), ('d', 2.77), ('I', 3.45), ('U', 1.46), ('z', 0.98), ('P', 0.65), ('V', 2.48), ('w', 4.59), ('f', 9.39), ('P', 0.12), ('L', 8.43), ('k', 5.67), ('e', 9.19), ('w', 6.35), ('z', 4.95), ('B', 4.84), ('u', 5.75), ('M', 9.51), ('a', 8.63), ('Y', 1.96), ('b', 4.29), ('a', 1.11), ('V', 0.56), ('g', 2.77), ('m', 0.15), ('r', 4.19), ('L', 3.64), ('d', 4.09), ('i', 9.32), ('t', 4.71), ('t', 5.82), ('u', 0.18), ('p', 7.63), ('F', 3.59), ('O', 6.65), ('B', 2.04), ('F', 7.13), ('l', 5.59), ('y', 1.94), ('u', 3.86), ('R', 8.34), ('V', 3.43), ('g', 1.89), ('A', 0.36), ('F', 9.78), ('p', 8.21), ('V', 0.85), ('A', 0.13), ('X', 4.51), ('t', 1.49), ('u', 6.97), ('M', 6.6), ('N', 5.21), ('k', 2.81), ('Y', 8.8), ('f', 9.6), ('i', 5.52), ('i', 9.48), ('r', 2.03), ('X', 3.7), ('E', 2.45), ('V', 2.03), ('I', 2.15), ('O', 5.02), ('y', 0.07), ('p', 6.36), ('m', 0.1), ('N', 5.67), ('R', 6.62), ('U', 3.58), ('Z', 7.73), ('W', 3.7), ('R', 0.34), ('S', 3.48), ('V', 9.13), ('a', 3.89), ('M', 7.46), ('X', 5.52), ('s', 2.32), ('v', 0.19), ('Z', 4.2), ('M', 7.72), ('F', 1.31), ('Z', 8.74), ('j', 8.02), ('S', 7.1), ('t', 0.96), ('Z', 3.14), ('N', 2.22), ('v', 5.75), ('U', 4.15), ('E', 0.09), ('B', 1.62), ('J', 0.19), ('p', 7.3), ('g', 5.0), ('E', 1.66), ('I', 0.06), ('V', 6.75), ('e', 8.08), ('I', 1.42), ('b', 0.8), ('D', 6.96), ('M', 5.86), ('v', 7.48), ('x', 9.96), ('Q', 2.74), ('c', 4.95), ('T', 0.33), ('k', 5.62), ('K', 0.63), ('o', 1.1), ('m', 8.71), ('u', 9.73), ('C', 8.56), ('V', 5.79), ('r', 1.66), ('n', 6.97), ('Q', 7.93), ('t', 4.66), ('E', 8.83), ('i', 9.73), ('l', 2.65), ('X', 3.44), ('m', 8.57), ('N', 2.25), ('o', 6.42), ('k', 8.46), ('P', 5.4), ('y', 2.2), ('w', 0.73), ('D', 8.58), ('u', 6.96), ('e', 8.05), ('w', 3.81), ('l', 3.33), ('D', 9.3), ('h', 3.07), ('n', 1.51), ('h', 5.46), ('E', 1.65), ('c', 6.78), ('o', 7.63), ('m', 7.07), ('X', 2.72), ('h', 9.58), ('F', 6.22), ('P', 4.86), ('S', 4.53), ('c', 3.6), ('B', 8.69), ('L', 9.33), ('V', 7.1), ('l', 0.21), ('E', 7.85), ('B', 6.46), ('R', 7.66), ('f', 9.23), ('B', 4.81), ('j', 0.99), ('w', 3.29), ('a', 9.76), ('o', 7.82), ('A', 7.59), ('u', 7.2), ('d', 8.89), ('a', 9.9), ('I', 6.65), ('D', 6.64), ('I', 7.53), ('n', 5.23), ('t', 6.94), ('S', 3.18), ('j', 4.79), ('m', 2.75), ('k', 1.36), ('Z', 4.96), ('v', 2.41), ('t', 7.55), ('r', 3.23), ('Y', 0.92), ('j', 2.08), ('M', 2.3), ('j', 0.6), ('q', 1.99), ('G', 1.03), ('Y', 9.52), ('D', 6.51), ('h', 2.26), ('x', 5.54), ('q', 1.26), ('H', 6.23), ('i', 7.82), ('d', 2.64), ('j', 8.53), ('K', 8.28), ('a', 7.95), ('F', 1.06), ('L', 2.27), ('u', 1.37), ('P', 5.42), ('Z', 8.74), ('W', 9.92), ('o', 5.26), ('l', 6.27), ('d', 7.43), ('a', 2.05), ('e', 0.48), ('G', 6.18), ('E', 1.85), ('N', 4.68), ('W', 0.37), ('r', 4.44), ('S', 0.28), ('G', 1.99), ('E', 6.58), ('e', 4.4), ('j', 2.32), ('Q', 6.22), ('u', 9.33), ('U', 0.37), ('s', 4.82), ('b', 4.69), ('k', 8.96), ('a', 0.9), ('v', 6.97), ('K', 6.59), ('a', 9.17), ('t', 6.64), ('U', 8.08), ('e', 4.41), ('f', 5.07), ('A', 1.13), ('v', 9.01), ('n', 6.63), ('L', 1.86), ('z', 4.66), ('v', 4.05), ('c', 6.14), ('H', 2.6), ('C', 1.92), ('M', 9.82), ('J', 1.99), ('T', 0.23), ('e', 0.06), ('r', 7.5), ('J', 1.59), ('t', 7.37), ('x', 8.85), ('A', 7.9), ('R', 4.51), ('p', 3.1), ('B', 7.76), ('e', 0.15), ('W', 0.95), ('L', 6.94), ('F', 8.85), ('s', 6.06), ('M', 0.68), ('C', 2.45), ('V', 6.74), ('t', 2.19), ('i', 0.59), ('U', 1.99), ('P', 4.25), ('Q', 5.91), ('Z', 5.36), ('m', 5.92), ('X', 3.87), ('a', 1.94), ('F', 1.89), ('j', 3.81), ('N', 7.46), ('T', 3.95), ('D', 5.3), ('h', 9.93), ('V', 7.65), ('S', 4.99), ('J', 2.63), ('V', 5.64), ('t', 10.0), ('I', 7.87), ('O', 9.27), ('j', 1.29), ('T', 7.69), ('S', 8.13), ('O', 8.64), ('W', 6.3), ('j', 1.53), ('F', 7.1), ('I', 1.9), ('l', 6.5), ('Y', 9.77), ('Y', 3.77), ('h', 4.61), ('g', 5.14), ('v', 1.24), ('m', 6.26), ('a', 2.55), ('V', 7.65), ('B', 4.02), ('P', 5.69), ('a', 0.06), ('h', 5.21), ('j', 8.04), ('S', 9.25), ('w', 1.01), ('N', 7.79), ('v', 7.23), ('j', 5.24), ('j', 8.51), ('w', 9.31), ('b', 2.65), ('A', 4.39), ('o', 4.99), ('D', 1.27), ('y', 0.99), ('n', 9.9), ('r', 2.13), ('h', 5.18), ('N', 7.88), ('i', 3.43), ('X', 3.3), ('Y', 6.81), ('n', 8.36), ('C', 1.73), ('O', 2.1), ('s', 9.61), ('Q', 4.24), ('D', 0.66), ('B', 1.36), ('O', 4.43), ('E', 5.4), ('G', 8.23), ('H', 5.09), ('h', 4.56), ('K', 1.09), ('A', 5.78), ('s', 1.56), ('R', 1.58), ('y', 6.72), ('j', 9.71), ('g', 1.56), ('u', 6.88), ('i', 7.98), ('e', 0.43), ('c', 5.24), ('d', 6.09), ('p', 5.31), ('l', 7.48), ('y', 2.05), ('W', 1.86), ('g', 3.2), ('w', 9.68), ('M', 6.91), ('W', 1.28), ('Z', 5.91), ('b', 6.29), ('Y', 2.22), ('i', 9.85), ('B', 3.97), ('f', 1.49), ('P', 5.44), ('x', 4.8), ('V', 6.81), ('Y', 5.59), ('H', 1.43), ('D', 9.39), ('U', 7.9), ('J', 0.85), ('b', 6.03), ('R', 8.38), ('X', 9.72), ('q', 7.99), ('R', 4.18), ('c', 9.06), ('G', 4.87), ('i', 3.56), ('l', 0.06), ('X', 7.46), ('y', 8.71), ('F', 2.41), ('Z', 4.17), ('a', 3.45), ('J', 8.27), ('K', 1.84), ('a', 7.81), ('n', 2.54), ('X', 5.08), ('g', 3.9), ('m', 5.34), ('O', 4.86), ('P', 1.42), ('S', 4.96), ('v', 1.56), ('b', 6.81), ('v', 1.54), ('P', 2.26), ('l', 5.32), ('O', 0.1), ('T', 6.88), ('G', 2.68), ('t', 2.42), ('p', 6.43), ('C', 7.65), ('L', 1.18), ('p', 6.42), ('Y', 4.04), ('H', 4.28), ('N', 3.28), ('D', 4.32), ('X', 3.34), ('s', 8.62), ('p', 1.85), ('t', 7.62), ('H', 9.75), ('b', 5.19), ('m', 9.62), ('Z', 7.21), ('i', 9.02), ('P', 2.38), ('d', 6.03), ('v', 6.07), ('Q', 1.88), ('p', 8.76), ('U', 8.99), ('l', 0.49), ('Y', 6.8), ('d', 2.2), ('e', 4.53), ('N', 7.42), ('A', 3.94), ('d', 5.31), ('H', 5.2), ('h', 1.26), ('Y', 2.21), ('l', 7.17), ('g', 5.71), ('i', 7.26), ('l', 9.7), ('R', 4.93), ('o', 6.81), ('K', 6.02), ('C', 4.12), ('m', 5.76), ('k', 1.7), ('S', 6.71), ('q', 8.7), ('c', 0.07), ('k', 5.79), ('Y', 9.51), ('O', 0.15), ('z', 5.05), ('D', 8.71), ('l', 8.32), ('Y', 3.54), ('d', 3.85), ('H', 7.87), ('e', 1.51), ('G', 4.64), ('T', 2.32), ('I', 1.97), ('i', 8.92), ('f', 9.84), ('O', 7.52), ('E', 8.39), ('m', 2.11), ('e', 8.34), ('z', 2.65), ('c', 9.9), ('N', 6.16), ('y', 9.74), ('O', 0.92), ('z', 2.25), ('B', 5.61), ('Q', 8.42), ('T', 2.56), ('v', 7.05), ('a', 5.36), ('h', 1.45), ('R', 2.96), ('Y', 0.86), ('w', 2.18), ('i', 8.51), ('I', 9.21), ('d', 5.42), ('z', 4.24), ('f', 3.29), ('T', 9.2), ('k', 1.51), ('v', 2.54), ('l', 1.86), ('f', 4.54), ('j', 7.27), ('K', 8.13), ('i', 7.71), ('J', 9.39), ('E', 6.21), ('w', 1.75), ('A', 2.04), ('a', 9.7), ('x', 6.29), ('S', 9.54), ('t', 6.27), ('z', 2.11), ('I', 5.71), ('y', 7.7), ('I', 4.27), ('g', 1.93), ('t', 6.23), ('P', 5.86), ('S', 5.34), ('W', 4.99), ('U', 3.69), ('r', 3.03), ('P', 4.62), ('r', 5.61), ('e', 4.45), ('L', 3.51), ('N', 5.65), ('g', 3.24), ('B', 3.58), ('k', 5.18), ('v', 6.07), ('Y', 7.45), ('i', 4.58), ('s', 4.24), ('A', 7.16), ('Q', 6.43), ('S', 6.73), ('x', 8.6), ('V', 0.05), ('g', 7.46), ('K', 1.43), ('L', 2.05), ('r', 0.32), ('K', 3.07), ('G', 5.86), ('Q', 7.76), ('v', 0.2), ('c', 8.54), ('g', 8.87), ('E', 9.32), ('A', 0.82), ('K', 7.75), ('x', 1.41), ('g', 6.59), ('f', 1.19), ('k', 0.48), ('b', 4.61), ('q', 1.26), ('Q', 7.39), ('h', 0.99), ('M', 1.0), ('v', 0.13), ('d', 7.45), ('X', 4.24), ('l', 5.95), ('i', 5.15), ('p', 8.38), ('X', 0.59), ('q', 8.2), ('K', 0.17), ('P', 6.52), ('y', 1.9), ('j', 9.58), ('m', 6.08), ('D', 7.4), ('S', 4.84), ('M', 7.16), ('g', 8.79), ('v', 1.9), ('r', 3.96), ('L', 9.1), ('O', 9.22)]
        floatTestMaps = scanl (\dist pair -> insert pair dist) empty floatTestValues
        intTestValues :: [(Char,Int)]
        intTestValues = map (\(o,p) -> (o, ceiling (p*1000::Double))) floatTestValues
        intTestMaps = scanl (\dist pair -> insert pair dist) empty intTestValues
        normalizedFloatMaps = map normalize $ tail floatTestMaps
        result = do
         mapM_ invariants floatTestMaps 
         mapM_ invariants intTestMaps
         mapM_ (maybe (Right ()) invariants) normalizedFloatMaps
         if all ((== Just 1) . fmap cumulate) normalizedFloatMaps
            then return ()
            else Left "Normalization failure"
    case result of
        Right _ -> print "ok"
        Left err -> do
            print err
            exitFailure


