# Klipperのシミュレーション用Dokcer環境

## 環境構築の流れ
`docker image build -t klipper-ubuntu`

`docker compose up`

`docker exec -it -u user klipper-docker-sim-klipper-linux-1 /bin/bash`

`docker run -it -u user -p80:80 -p7125:7125 klipper-ubuntu /sbin/init`

### docker環境内後の操作
`cd ~`
`git clone https://github.com/th33xitus/kiauh.git`
`./kiauh/kiauh.sh`

### simulavrの構築
`sudo apt update`
`sudo apt install g++ make cmake swig rst2pdf help2man texinfo`
`make cfgclean python debian`
`sudo dpkg -i build/debian/python3-simulavr*.deb`

`PYTHONPATH=~/simulavr/build/pysimulavr/ ./scripts/avrsim.py out/klipper.elf`

## コンテナ起動後の流れ
1. `docker exec -it -u user <コンテナ名> /bin/bash`: コンテナ内にuserとして入る
2. `PYTHONPATH=~/simulavr/build/pysimulavr/ ~/klipper/scripts/avrsim.py ~/klipper/out/klipper.elf`

