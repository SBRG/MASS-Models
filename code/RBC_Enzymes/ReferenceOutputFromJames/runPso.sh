#!/bin/bash

# Initialize Files
header="elapsed_time, best.fitness, num_generations, pop_size, neighborhood_size, inertia, cognitive_rate, social_rate"
echo $header > /media/users/jdebree/Mathematica/ADK1/PSO_files/Development/summary.txt
> /media/users/jdebree/Mathematica/ADK1/PSO_files/Development/results.txt

# Import Dependencies
num_trials=2
trial_num=1

while ((trial_num<=num_trials))
do
    echo "Trial Number: $trial_num"
    python /media/users/jdebree/Mathematica/pso_short_ver0.06.py /media/users/jdebree/Mathematica/ADK1/PSO_files/Development/psoParameters.txt /media/users/jdebree/Mathematica/ADK1/PSO_files/Development/summary.txt /media/users/jdebree/Mathematica/ADK1/PSO_files/Development/results.txt
    let trial_num+=1
done