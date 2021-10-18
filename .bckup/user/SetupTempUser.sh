## set up a test user expriring on 2021-10-26

Pre=$1
name='test_'${Pre}

PW='test123!!'

useradd -m ${name} -e "2021-10-26"

echo ${PW} | passwd ${name} --stdin

#sudo userdel -rf $name
