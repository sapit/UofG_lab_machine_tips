project_name=my_project

cp -r ~/$project_name /scratch/$project_name

conda create -y python=3.6 -p /scratch/$project_name/my_env
cd /scratch/$project_name
source activate my_env
rm -rf ~/.cache/pip/*
yes | pip install -r requirements.txt
