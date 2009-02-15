; Expanding the square function means that each call to expmod results in 2 further (identical) calls to expmod. This means that instead of halving the size of the problem with each step (i.e. O(log n), each half-problem is evaluated twice, bringing runtime back to O(n).