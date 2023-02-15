
# Script to retrieve the number of active registered or anonym accounts with uid , mobile app,creditcard ,coupon loyalty and EFR_CODE of the productive e-vending system.
# The script uses the 'psql' command line tool which is installed together with 'pgAdmin' to post queries to the productive PostgreSQL database.
# The output is written to the file specified by '$OUTPUTFILE'
#
# vkuepo, 03.09.2018


DATE=`date +%0d.%0m.%Y`
OUTPUTFILE="e-vending_transactions_$DATE.txt"
echo $OUTPUTFILE


# The password is retrieved by "psql" from the environment variable "PGPASSWORD".
# Therefore we have to set this environment variable first.
export PGPASSWORD=loj2eZbgufnlHVqwOROEzpukW31VQmGU



# get total number of active transactions in June 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1527811200000' 
and t.timestamp <='1530403199000'" -o totalnbrtransactionsJune.tmp
# get total number of successful transactions in June 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1527811200000' 
and t.timestamp <='1530403199000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsJune.18.tmp
# get total number of failed transactions in June 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1527811200000' 
and t.timestamp <='1530403199000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsJune.18.tmp
# get total number of reversed transactions in June 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1527811200000' 
and t.timestamp <='1530403199000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsJune.18.tmp	
# get total number of REVERSE_DONE transactions in June 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1527811200000' 
and t.timestamp <='1530403199000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEJune.18.tmp
# get total number of REVERSE_PENDING transactions in June 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1527811200000' 
and t.timestamp <='1530403199000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGJune.18.tmp	
# get total number of NOT_VERIFIED transactions in June 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1527811200000' 
and t.timestamp <='1530403199000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGJune.18.tmp		


# get total number of active transactions in July 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1530403200000' 
and t.timestamp <='1533081599000'" -o totalnbrtransactionsJuli.18.tmp
# get total number of successful transactions in July 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1530403200000' 
and t.timestamp <='1533081599000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsJuli.18.tmp
# get total number of failed transactions in July 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1530403200000' 
and t.timestamp <='1533081599000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsJuli.18.tmp
# get total number of reversed transactions in July 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1530403200000' 
and t.timestamp <='1533081599000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsJuli.18.tmp	
# get total number of REVERSE_DONE transactions in July 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1530403200000' 
and t.timestamp <='1533081599000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEJuli.18.tmp
# get total number of REVERSE_PENDING transactions in July 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1530403200000' 
and t.timestamp <='1533081599000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGJuli.18.tmp	
# get total number of NOT_VERIFIED transactions in July 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1530403200000' 
and t.timestamp <='1533081599000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGJuli.18.tmp


# get total number of active transactions in August 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1533081600000' 
and t.timestamp <='1535759999000'" -o totalnbrtransactionsAugust.18.tmp
# get total number of successful transactions in August 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1533081600000' 
and t.timestamp <='1535759999000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsAugust.18.tmp
# get total number of failed transactions in August 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1533081600000' 
and t.timestamp <='1535759999000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsAugust.18.tmp
# get total number of reversed transactions in August 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1533081600000' 
and t.timestamp <='1535759999000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsAugust.18.tmp	
# get total number of REVERSE_DONE transactions in August 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1533081600000' 
and t.timestamp <='1535759999000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEAugust.18.tmp
# get total number of REVERSE_PENDING transactions in August 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1533081600000' 
and t.timestamp <='1535759999000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGAugust.18.tmp	
# get total number of NOT_VERIFIED transactions in August 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1533081600000' 
and t.timestamp <='1535759999000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGAugust.18.tmp


# get total number of active transactions in September 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1535760000000' 
and t.timestamp <='1538351999000'" -o totalnbrtransactionsSeptember.18.tmp					 
# get total number of successful transactions in September 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1535760000000' 
and t.timestamp <='1538351999000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsSeptember.18.tmp
# get total number of failed transactions in September 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1535760000000' 
and t.timestamp <='1538351999000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsSeptember.18.tmp
# get total number of reversed transactions in September 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1535760000000' 
and t.timestamp <='1538351999000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsSeptember.18.tmp	
# get total number of REVERSE_DONE transactions in September 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1535760000000' 
and t.timestamp <='1538351999000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONESeptember.18.tmp
# get total number of REVERSE_PENDING transactions in September 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1535760000000' 
and t.timestamp <='1538351999000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGSeptember.18.tmp	
# get total number of NOT_VERIFIED transactions in September 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1535760000000' 
and t.timestamp <='1538351999000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGSeptember.18.tmp	

# get total number of active transactions in October 2018----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1538352000000' 
and t.timestamp <='1541030399000'" -o totalnbrtransactionsOctber.18.tmp					 
# get total number of successful transactions in Octber 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1538352000000' 
and t.timestamp <='1541030399000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsOctber.18.tmp
# get total number of failed transactions in Octber 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1538352000000' 
and t.timestamp <='1541030399000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsOctber.18.tmp
# get total number of reversed transactions in Octber 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1538352000000' 
and t.timestamp <='1541030399000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsOctber.18.tmp	
# get total number of REVERSE_DONE transactions in Octber 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1538352000000' 
and t.timestamp <='1541030399000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEOctber.18.tmp
# get total number of REVERSE_PENDING transactions in Octber 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1538352000000' 
and t.timestamp <='1541030399000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGOctber.18.tmp	
# get total number of NOT_VERIFIED transactions in Octber 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1538352000000' 
and t.timestamp <='1541030399000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGOctber.18.tmp	

# get total number of active transactions in November 2018----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1541030400000' 
and t.timestamp <='1543622399000'" -o totalnbrtransactionsNovember.18.tmp					 
# get total number of successful transactions in November 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1541030400000' 
and t.timestamp <='1543622399000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsNovember.18.tmp
# get total number of failed transactions in November 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1541030400000' 
and t.timestamp <='1543622399000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsNovember.18.tmp
# get total number of reversed transactions in November 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1541030400000' 
and t.timestamp <='1543622399000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsNovember.18.tmp	
# get total number of REVERSE_DONE transactions in November 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1541030400000' 
and t.timestamp <='1543622399000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONENovember.18.tmp
# get total number of REVERSE_PENDING transactions in November 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1541030400000' 
and t.timestamp <='1543622399000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGNovember.18.tmp	
# get total number of NOT_VERIFIED transactions in November 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1541030400000' 
and t.timestamp <='1543622399000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGNovember.18.tmp	

# get total number of active transactions in December 2018----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1543622400000' 
and t.timestamp <='1546300799000'" -o totalnbrtransactionsDecember.18.tmp					 
# get total number of successful transactions in December 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1543622400000' 
and t.timestamp <='1546300799000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsDecember.18.tmp
# get total number of failed transactions in December 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1543622400000' 
and t.timestamp <='1546300799000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsDecember.18.tmp
# get total number of reversed transactions in December 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1543622400000' 
and t.timestamp <='1546300799000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsDecember.18.tmp	
# get total number of REVERSE_DONE transactions in December 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1543622400000' 
and t.timestamp <='1546300799000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEDecember.18.tmp
# get total number of REVERSE_PENDING transactions in December 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1543622400000' 
and t.timestamp <='1546300799000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGDecember.18.tmp	
# get total number of NOT_VERIFIED transactions in December 2018-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1543622400000' 
and t.timestamp <='1546300799000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGDecember.18.tmp		

# get total number of active transactions in January 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1546300800000' 
and t.timestamp <='1548979199000'" -o totalnbrtransactionsJanuary.19.tmp					 
# get total number of successful transactions in January 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1546300800000' 
and t.timestamp <='1548979199000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsJanuary.19.tmp
# get total number of failed transactions in January 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1546300800000' 
and t.timestamp <='1548979199000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsJanuary.19.tmp
# get total number of reversed transactions in January 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1546300800000' 
and t.timestamp <='1548979199000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsJanuary.19.tmp	
# get total number of REVERSE_DONE transactions in January 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1546300800000' 
and t.timestamp <='1548979199000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEJanuary.19.tmp
# get total number of REVERSE_PENDING transactions in January 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1546300800000' 
and t.timestamp <='1548979199000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGJanuary.19.tmp	
# get total number of NOT_VERIFIED transactions in January 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1546300800000' 
and t.timestamp <='1548979199000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGJanuary.19.tmp	


# get total number of active transactions in Febuary 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1549022400000' 
and t.timestamp <='1551398399000'" -o totalnbrtransactionsFebuary.19.tmp					 
# get total number of successful transactions in Febuary 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1549022400000' 
and t.timestamp <='1551398399000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsFebuary.19.tmp
# get total number of failed transactions in Febuary 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1549022400000' 
and t.timestamp <='1551398399000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsFebuary.19.tmp
# get total number of reversed transactions in Febuary 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1549022400000' 
and t.timestamp <='1551398399000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsFebuary.19.tmp	
# get total number of REVERSE_DONE transactions in Febuary 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1549022400000' 
and t.timestamp <='1551398399000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEFebuary.19.tmp
# get total number of REVERSE_PENDING transactions in Febuary 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1549022400000' 
and t.timestamp <='1551398399000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGFebuary.19.tmp	
# get total number of NOT_VERIFIED transactions in Febuary 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1549022400000' 
and t.timestamp <='1551398399000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGFebuary.19.tmp	


# get total number of active transactions in March 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1551398400000' 
and t.timestamp <='1554033599000'" -o totalnbrtransactionsMarch.19.tmp					 
# get total number of successful transactions in March 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1551398400000' 
and t.timestamp <='1554033599000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsMarch.19.tmp
# get total number of failed transactions in March 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1551398400000' 
and t.timestamp <='1554033599000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsMarch.19.tmp
# get total number of reversed transactions in March 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1551398400000' 
and t.timestamp <='1554033599000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsMarch.19.tmp	
# get total number of REVERSE_DONE transactions in March 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1551398400000' 
and t.timestamp <='1554033599000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEMarch.19.tmp
# get total number of REVERSE_PENDING transactions in March 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1551398400000' 
and t.timestamp <='1554033599000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGMarch.19.tmp	
# get total number of NOT_VERIFIED transactions in March 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1551398400000' 
and t.timestamp <='1554033599000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGMarch.19.tmp	


# get total number of active transactions in April 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1554076800000' 
and t.timestamp <='1556625599000'" -o totalnbrtransactionsApril.19.tmp					 
# get total number of successful transactions in April 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1554076800000' 
and t.timestamp <='1556625599000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsApril.19.tmp
# get total number of failed transactions in April 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1554076800000' 
and t.timestamp <='1556625599000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsApril.19.tmp
# get total number of reversed transactions in April 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1554076800000' 
and t.timestamp <='1556625599000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsApril.19.tmp	
# get total number of REVERSE_DONE transactions in April 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1554076800000' 
and t.timestamp <='1556625599000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEApril.19.tmp
# get total number of REVERSE_PENDING transactions in April 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1554076800000' 
and t.timestamp <='1556625599000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGApril.19.tmp	
# get total number of NOT_VERIFIED transactions in April 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1554076800000' 
and t.timestamp <='1556625599000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGApril.19.tmp	

# get total number of active transactions in Mai 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1556668800000' 
and t.timestamp <='1559303999000'" -o totalnbrtransactionsMai.19.tmp					 
# get total number of successful transactions in Mai 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1556668800000' 
and t.timestamp <='1559303999000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsMai.19.tmp
# get total number of failed transactions in Mai 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1556668800000' 
and t.timestamp <='1559303999000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsMai.19.tmp
# get total number of reversed transactions in Mai 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1556668800000' 
and t.timestamp <='1559303999000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsMai.19.tmp	
# get total number of REVERSE_DONE transactions in Mai 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1556668800000' 
and t.timestamp <='1559303999000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEMai.19.tmp
# get total number of REVERSE_PENDING transactions in Mai 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1556668800000' 
and t.timestamp <='1559303999000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGMai.19.tmp	
# get total number of NOT_VERIFIED transactions in Mai 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1556668800000' 
and t.timestamp <='1559303999000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGMai.19.tmp	


# get total number of active transactions in June 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1559347200000' 
and t.timestamp <='1561895999000'" -o totalnbrtransactionsJune.19.tmp					 
# get total number of successful transactions in June 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1559347200000' 
and t.timestamp <='1561895999000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsJune.19.tmp
# get total number of failed transactions in June 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1559347200000' 
and t.timestamp <='1561895999000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsJune.19.tmp
# get total number of reversed transactions in June 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1559347200000' 
and t.timestamp <='1561895999000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsJune.19.tmp	
# get total number of REVERSE_DONE transactions in June 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1559347200000' 
and t.timestamp <='1561895999000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEJune.19.tmp
# get total number of REVERSE_PENDING transactions in June 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1559347200000' 
and t.timestamp <='1561895999000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGJune.19.tmp	
# get total number of NOT_VERIFIED transactions in June 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1559347200000' 
and t.timestamp <='1561895999000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGJune.19.tmp	

# get total number of active transactions in July 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1561939200000' 
and t.timestamp <='1564574399000'" -o totalnbrtransactionsJuly.19.tmp					 
# get total number of successful transactions in July 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1561939200000' 
and t.timestamp <='1564574399000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsJuly.19.tmp
# get total number of failed transactions in July 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1561939200000' 
and t.timestamp <='1564574399000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsJuly.19.tmp
# get total number of reversed transactions in July 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1561939200000' 
and t.timestamp <='1564574399000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsJuly.19.tmp	
# get total number of REVERSE_DONE transactions in July 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1561939200000' 
and t.timestamp <='1564574399000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEJuly.19.tmp
# get total number of REVERSE_PENDING transactions in July 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1561939200000' 
and t.timestamp <='1564574399000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGJuly.19.tmp	
# get total number of NOT_VERIFIED transactions in July 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1561939200000' 
and t.timestamp <='1564574399000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGJuly.19.tmp	


# get total number of active transactions in August 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1564617600000' 
and t.timestamp <='1567252799000'" -o totalnbrtransactionsAugust.19.tmp					 
# get total number of successful transactions in August 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1564617600000' 
and t.timestamp <='1567252799000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsAugust.19.tmp
# get total number of failed transactions in August 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1564617600000' 
and t.timestamp <='1567252799000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsAugust.19.tmp
# get total number of reversed transactions in August 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1564617600000' 
and t.timestamp <='1567252799000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsAugust.19.tmp	
# get total number of REVERSE_DONE transactions in August 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1564617600000' 
and t.timestamp <='1567252799000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEAugust.19.tmp
# get total number of REVERSE_PENDING transactions in August 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1564617600000' 
and t.timestamp <='1567252799000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGAugust.19.tmp	
# get total number of NOT_VERIFIED transactions in August 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1564617600000' 
and t.timestamp <='1567252799000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGAugust.19.tmp	


# get total number of active transactions in September 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1567296000000' 
and t.timestamp <='1569844799000'" -o totalnbrtransactionsSeptember.19.tmp					 
# get total number of successful transactions in September 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1567296000000' 
and t.timestamp <='1569844799000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsSeptember.19.tmp
# get total number of failed transactions in September 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1567296000000' 
and t.timestamp <='1569844799000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsSeptember.19.tmp
# get total number of reversed transactions in September 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1567296000000' 
and t.timestamp <='1569844799000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsSeptember.19.tmp	
# get total number of REVERSE_DONE transactions in September 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1567296000000' 
and t.timestamp <='1569844799000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONESeptember.19.tmp
# get total number of REVERSE_PENDING transactions in September 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1567296000000' 
and t.timestamp <='1569844799000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGSeptember.19.tmp	
# get total number of NOT_VERIFIED transactions in September 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1567296000000' 
and t.timestamp <='1569844799000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGSeptember.19.tmp	


# get total number of active transactions in October 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1569888000000' 
and t.timestamp <='1572523199000'" -o totalnbrtransactionsOctober.19.tmp					 
# get total number of successful transactions in October 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1569888000000' 
and t.timestamp <='1572523199000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsOctober.19.tmp
# get total number of failed transactions in October 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1569888000000' 
and t.timestamp <='1572523199000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsOctober.19.tmp
# get total number of reversed transactions in October 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1569888000000' 
and t.timestamp <='1572523199000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsOctober.19.tmp	
# get total number of REVERSE_DONE transactions in October 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1569888000000' 
and t.timestamp <='1572523199000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEOctober.19.tmp
# get total number of REVERSE_PENDING transactions in October 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1569888000000' 
and t.timestamp <='1572523199000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGOctober.19.tmp	
# get total number of NOT_VERIFIED transactions in October 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1569888000000' 
and t.timestamp <='1572523199000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGOctober.19.tmp	


# get total number of active transactions in November 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1572566400000' 
and t.timestamp <='1575115199000'" -o totalnbrtransactionsNovember.19.tmp					 
# get total number of successful transactions in November 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1572566400000' 
and t.timestamp <='1575115199000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsNovember.19.tmp
# get total number of failed transactions in November 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1572566400000' 
and t.timestamp <='1575115199000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsNovember.19.tmp
# get total number of reversed transactions in November 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1572566400000' 
and t.timestamp <='1575115199000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsNovember.19.tmp	
# get total number of REVERSE_DONE transactions in November 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1572566400000' 
and t.timestamp <='1575115199000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONENovember.19.tmp
# get total number of REVERSE_PENDING transactions in November 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1572566400000' 
and t.timestamp <='1575115199000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGNovember.19.tmp	
# get total number of NOT_VERIFIED transactions in November 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1572566400000' 
and t.timestamp <='1575115199000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGNovember.19.tmp	


# get total number of active transactions in December 2019----------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1575158400000' 
and t.timestamp <='1577793599000'" -o totalnbrtransactionsDecember.19.tmp					 
# get total number of successful transactions in December 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1575158400000' 
and t.timestamp <='1577793599000' and transactionstate ='SUCCESS'"  -o totalnbrsuccessfultransactionsDecember.19.tmp
# get total number of failed transactions in December 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1575158400000' 
and t.timestamp <='1577793599000' and transactionstate = 'FAILED'"  -o totalnbrFAILEDtransactionsDecember.19.tmp
# get total number of reversed transactions in December 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1575158400000' 
and t.timestamp <='1577793599000' and transactionstate ='REVERSED'"  -o totalnbrREVERSEDtransactionsDecember.19.tmp	
# get total number of REVERSE_DONE transactions in December 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1575158400000' 
and t.timestamp <='1577793599000' and transactionstate ='REVERSE_DONE'"  -o totalnbrREVERSE_DONEDecember.19.tmp
# get total number of REVERSE_PENDING transactions in December 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1575158400000' 
and t.timestamp <='1577793599000' and transactionstate ='REVERSE_PENDING'"  -o totalnbrREVERSE_PENDINGDecember.19.tmp	
# get total number of NOT_VERIFIED transactions in December 2019-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h reporting-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d reporting -p 5432 -c "select count(id) From transaction t where t.timestamp >='1575158400000' 
and t.timestamp <='1577793599000' and transactionstate ='NOT_VERIFIED'"  -o totalnbrNOT_VERIFIEDGDecember.19.tmp		 
		 		 
		 
					 

# read some input from the shell to keep the shell open to see the output when the script is run

if [ -e $OUTPUTFILE ]
then 
	rm -rf $OUTPUTFILE 
fi

echo -e "Number of Transactions
 as of $DATE\r" >> $OUTPUTFILE 
echo -e "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 



echo -e "------------------------------- Transactions Status in December 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in December 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsDecember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in December 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsDecember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in December 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsDecember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in December 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsDecember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in December 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEDecember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in December 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGDecember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in December 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGDecember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in November 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in November 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsNovember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in November 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsNovember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in November 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsNovember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in November 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsNovember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in November 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in November 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGNovember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in November 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGNovember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in October 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in October 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in October 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in October 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in October 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in October 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in October 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in October 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGOctober.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in September 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONESeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE


echo -e "------------------------------- Transactions Status in September 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONESeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in September 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGSeptember.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in August 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in August 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsAugust.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in August 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsAugust.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in August 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsAugust.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in August 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsAugust.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in August 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEAugust.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in August 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGAugust.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in August 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGAugust.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in July 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in July 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsJuly.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in July 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsJuly.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in July 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsJuly.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in July 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsJuly.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in July 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEJuly.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in July 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGJuly.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in July 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGJuly.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in June 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in June 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsJune.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in June 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsJune.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in June 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsJune.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in June 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsJune.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in June 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEJune.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in June 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGJune.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in June 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGJune.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE


echo -e "------------------------------- Transactions Status in Mai 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in Mai 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsMai.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in Mai 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsMai.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in Mai 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsMai.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in Mai 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsMai.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in Mai 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEMai.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in Mai 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGMai.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in Mai 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGMai.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE


echo -e "------------------------------- Transactions Status in April 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in April 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsApril.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in April 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsApril.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in April 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsApril.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in April 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsApril.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in April 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEApril.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in April 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGApril.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in April 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGApril.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE


echo -e "------------------------------- Transactions Status in March 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in March 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsMarch.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in March 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsMarch.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in March 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsMarch.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in March 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsMarch.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in March 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEMarch.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in March 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGMarch.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in March 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGMarch.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in Febuary 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in Febuary 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsFebuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in Febuary 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsFebuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in Febuary 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsFebuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in Febuary 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsFebuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in Febuary 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEFebuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in Febuary 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGFebuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in Febuary 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGFebuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in January 2019------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in January 2019 :" >> $OUTPUTFILE 
cat totalnbrtransactionsJanuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in January 2019 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsJanuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in January 2019 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsJanuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in January 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsJanuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in January 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEJanuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in January 2019 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGJanuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in January 2019 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGJanuary.19.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in December 2018------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in December 2018 :" >> $OUTPUTFILE 
cat totalnbrtransactionsDecember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in December 2018 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsDecember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in December 2018 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsDecember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in December 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsDecember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in December 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEDecember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in December 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGDecember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in December 2018 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGDecember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE


echo -e "------------------------------- Transactions Status in November 2018------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in November 2018 :" >> $OUTPUTFILE 
cat totalnbrtransactionsNovember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in November 2018 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsNovember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in November 2018 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsNovember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in November 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsNovember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in November 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONENovember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in November 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGNovember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in November 2018 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGNovember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE


echo -e "------------------------------- Transactions Status in October 2018------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in October 2018 :" >> $OUTPUTFILE 
cat totalnbrtransactionsOctber.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in October 2018 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsOctber.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in October 2018 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsOctber.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in October 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsOctber.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in October 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEOctber.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in October 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGOctber.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in October 2018 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGOctber.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "------------------------------- Transactions Status in September 2018------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of Transactions in September 2018 :" >> $OUTPUTFILE 
cat totalnbrtransactionsSeptember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in September 2018 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsSeptember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in September 2018 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsSeptember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in September 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsSeptember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in September 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONESeptember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in September 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGSeptember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in September 2018 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGSeptember.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE


echo -e "-------------------------------Transactions Status in August 2018-----------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "Number of Transactions in August 2018 :" >> $OUTPUTFILE 
cat totalnbrtransactionsAugust.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of successful Transactions in August 2018 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsAugust.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in August 2018 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsAugust.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in August 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsAugust.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in August 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEAugust.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in August 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGAugust.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in August 2018 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGAugust.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "-------------------------------Transactions Status in Juli 2018-------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "Number of Transactions in Juli 2018 :" >> $OUTPUTFILE 
cat totalnbrtransactionsJuli.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of successful Transactions in Juli 2018 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsJuli.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in Juli 2018 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsJuli.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in Juli 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsJuli.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in Juli 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEJuli.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in Juli 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGJuli.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in Juli 2018 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGJuli.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE
echo -e "-------------------------------Transactions Status in june 2018-------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
					 
echo -e "Number of Transactions in june 2018 :" >> $OUTPUTFILE 
cat totalnbrtransactionsJune.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of successful Transactions in june 2018 :" >> $OUTPUTFILE 
cat totalnbrsuccessfultransactionsJune.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of failed Transactions in june 2018 :" >> $OUTPUTFILE 
cat totalnbrFAILEDtransactionsJune.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed Transactions in june 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSEDtransactionsJune.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed done Transactions in june 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_DONEJune.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed pending  Transactions in june 2018 :" >> $OUTPUTFILE 
cat totalnbrREVERSE_PENDINGJune.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of reversed not verified Transactions in june 2018 :" >> $OUTPUTFILE 
cat totalnbrNOT_VERIFIEDGJune.18.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

rm *.tmp  




