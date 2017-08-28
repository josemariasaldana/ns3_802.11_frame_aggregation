# ns3_802.11_frame_aggregation
ns3 scripts for simulating scenarios in which 802.11 frame aggregation is studied

## Citation
If you use this code, please cite the next research article:

Jose Saldana, Jose Ruiz-Mas, Jose Almodovar, "Frame Aggregation in Central Controlled
802.11 WLANs: the Latency vs. Throughput Trade-off," IEEE Communications Letters,
accepted for publication, August 2017.
http://dx.doi.org/10.1109/LCOMM.2017.2741940
(the citation will be updated as soon as the paper is published in paper)

http://ieeexplore.ieee.org/document/8013762/

Author's self-archive version: http://diec.unizar.es/~jsaldana/personal/amsterdam_2017_in_proc.pdf


## Content of the repository

The `.cc` file contains the ns3 script. It has been run with ns3-26 (https://www.nsnam.org/ns-3-26/).

The folder `shell_scripts_used_in_the_paper` contains the files used for obtaining each of
the figures presented in the paper.


## How to use it

- Download ns3.

- Put the `.cc` file in the `ns-3.26/scratch` directory.

- Put a `.sh` file in the `ns-3.26` directory.

- Run a `.sh` file. (You may need to adjust the name of the `.cc` file in the `.sh` script).