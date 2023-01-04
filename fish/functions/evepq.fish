function evepq --wraps=docker\ exec\ -it\ pg-eve\ su\ postgres\ -c\ \'psql\ -U\ eve\' --description alias\ evepq=docker\ exec\ -it\ pg-eve\ su\ postgres\ -c\ \'psql\ -U\ eve\'
  docker exec -it pg-eve su postgres -c 'psql -U eve' $argv; 
end
