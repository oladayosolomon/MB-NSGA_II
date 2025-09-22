# RLXBench
This code is built upon PlatEMO v4.2 (https://github.com/BIMK/PlatEMO) to be installed on MATLAB 2023 and above. It also requires Python 3.9, and the Causal Learner: A Toolbox for Causal Structure and Markov Blanket Learning for MB Learning (https://github.com/z-dragonl/Causal-Learner). <br />
Clone this repository and install the packages specified in requirements.txt in a Python environment<br />
```
git clone https://github.com/oladayosolomon/MB-NSGA_II/
cd MB-NSGA_II
pip install -r requirements.txt
```


Add the path of the environment to your MATLAB <br />

```
pyenv("Version",'C:\Users\ecis\anaconda3\envs\RL_Bench\python.exe')

```

Clone the Casual Learner toolbox from (https://github.com/z-dragonl/Causal-Learner) and add its path to MATLAB<br />

Run the Platemo.m file from MATLAB and navigate to the experiment mode on the GUI. You can reproduce the experiments in this work by using the settings file in .\MB-NSGA_II\Data




