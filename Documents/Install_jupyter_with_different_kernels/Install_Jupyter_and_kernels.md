# Install Jupyter and and link notebooks to various conda environments

  - Launch an EC2 instance ensuring to enable incoming traffic on port
    8888 on the Security Group and connect to it

<!-- end list -->

  - From the terminal run the following commands:
    
      - sudo apt-get -y update
    
      - cd /tmp
    
      - wget
        <https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh>
    
      - bash Anaconda3-2020.02-Linux-x86\_64.sh
    
      - Leave all the defaults setting and let anaconda install and
        initialize Anaconda
    
      - source ~/.bashrc
        
          - At this point the terminal should show the (base)
            environment
    
      - OPTIONAL: conda update -n base -c defaults conda (to update
        conda to latest version)
    
      - conda create --name S20V1 python=3.6 -y (if you put just 3 he
        will install the latest one)
    
      - conda activate S20V1
        
          - This will allow you to enter the newly created environment
    
      - conda install ipykernel
    
      - python -m ipykernel install --user --name=\<anyName\>
        
          - this will enable the possibility to link a jupyter notebook
            to a specific virtual environment
    
      - conda deactivate

  - **From base environment** launch jupyter and connect to it from your
    browser
    
      - nohup jupyter notebook --ip=0.0.0.0 &
        
          - nohup let the process running on another bash (shell), so
            that even if the shell from which jupyter is closed, jupyter
            will continue to run in background
        
          - Note: in the nohup.out file you will have the address you
            should connect to + the token

![](.//media/image1.png)

  - From your local machine connect to the jupyter notebook typing the
    proper address, i.e.:
    
      - \<publicIP of the EC2 instance\>:8888/?token=\<token from the
        nohup.out\>

  - You will be prompted to the Jupyter notebook

![](.//media/image2.png)

  - You have also the ability to select the kernel linked to the conda
    environment of your interest:

![](.//media/image3.png)
