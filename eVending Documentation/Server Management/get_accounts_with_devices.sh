# Script to retrieve the number of active registered or anonym accounts with uid , mobile app,creditcard ,coupon loyalty and EFR_CODE of the productive e-vending system.
# The script uses the 'psql' command line tool which is installed together with 'pgAdmin' to post queries to the productive PostgreSQL database.
# The output is written to the file specified by '$OUTPUTFILE'
#
# vkuepo, 03.09.2018


DATE=`date +%0d.%0m.%Y`
OUTPUTFILE="e-vending_active_accounts_with_devices_$DATE.txt"
echo $OUTPUTFILE


# The password is retrieved by "psql" from the environment variable "PGPASSWORD".
# Therefore we have to set this environment variable first.
export PGPASSWORD=ZJDoJxdLUSinL3dBKrxYRkiYE3Cyx7nC


# get number of active  accounts with devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_devices" -o nbrActiveAccountsWithDevices.tmp
					 
					 
# get number of inactive accounts with devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'INACTIVE' AND aa.state = 'INACTIVE'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_devices" -o nbrInActiveAccountsWithDevices.tmp
					 
# get number of DELETED accounts with devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'DELETED' AND aa.state = 'DELETED'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_devices" -o nbrDELETEDAccountsWithDevices.tmp
					 
					 
# get number of active registered accounts with devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND a.type ='CONSUMER_WITH_LOGIN'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_devices" -o nbrActiveRegisteredAccounts.tmp
					 
# get number of active anonym accounts with devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND a.type ='CONSUMER_ANONYM'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_devices" -o nbrActiveAnonymAccounts.tmp

# get number of active loyalty accounts with devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE'  AND a.type ='LOYALTY'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) loyalty" -o nbrActiveLoyaltyAccounts.tmp					 


# get number of active registered accounts with UID 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='UID' AND a.type ='CONSUMER_WITH_LOGIN'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) uid_login" -o nbrActiveRegisteredUID.tmp


# get number of active registered accounts with mobile App 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) mobile_login" -o nbrActiveRegisteredMobileApp.tmp


# get number of active anonym accounts with UID 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='UID'  AND a.type ='CONSUMER_ANONYM'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) uid_anonym" -o nbrActiveAnonymUID.tmp


# get number of active anonym accounts with mobile App 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_ANONYM'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype ) mobile_anonym" -o nbrActiveAnonymMobileApp.tmp


# get number of active registered accounts with CREDITCARD 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='CREDITCARD' AND a.type ='CONSUMER_WITH_LOGIN'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) creditcard_login" -o nbrActiveRegisteredCREDITCARD.tmp


# get number of active anonym accounts with CREDITCARD 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='CREDITCARD'  AND a.type ='CONSUMER_ANONYM'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) creditcard_anonym" -o nbrActiveAnonymCREDITCARD.tmp


# get number of active loyalty accounts with COUPON_LOYALTY 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='COUPON_LOYALTY' AND a.type ='LOYALTY'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) coupon_loyalty_login" -o nbrActiveRegisteredCOUPON_LOYALTY.tmp


# get number of active loyalty accounts with COUPON_LOYALTY 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='COUPON_LOYALTY'  AND a.type ='LOYALTY'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) coupon_loyalty_anonym" -o nbrActiveAnonymCOUPON_LOYALTY.tmp

# get number of deleted accounts with UID 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'DELETED' AND aa.state = 'DELETED' AND aa.mediatype='UID'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_deleted" -o nbrDeletedAccountsWithUID.tmp
					 
# get number of deleted accounts with Mobile APP
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'DELETED' AND aa.state = 'DELETED' AND aa.mediatype='MOBILE_APP'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_deleted" -o nbrDeletedAccountsWithMOBILE_APP.tmp
					 
# get number of deleted accounts with CREDITCARD
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'DELETED' AND aa.state = 'DELETED' AND aa.mediatype='CREDITCARD'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_deleted" -o nbrDeletedAccountsWithCREDITCARD.tmp
					 
# get number of deleted accounts with COUPON_LOYALTY
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'DELETED' AND aa.state = 'DELETED' AND aa.mediatype='COUPON_LOYALTY'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_deleted" -o nbrDeletedAccountsWithCOUPON_LOYALTY.tmp
					 
# get number of deleted accounts with EFR_CODE
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'DELETED' AND aa.state = 'DELETED' AND aa.mediatype='EFR_CODE'
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) all_deleted" -o nbrDeletedAccountsWithEFR_CODE.tmp
					 
# get number of active registered accounts having exactly one UID 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='UID'  AND a.type ='CONSUMER_WITH_LOGIN'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)=1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrUIDWithOneUID.tmp
					 
# get number of active registered accounts having more than one UID 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='UID'  AND a.type ='CONSUMER_WITH_LOGIN'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrUIDWithMoreThanOneUID.tmp
					 
# get number of active anonym accounts having exactly one UID 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='UID'  AND a.type ='CONSUMER_ANONYM'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)=1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrAnonymWithOneUID.tmp
					 
# get number of active anonym accounts having more than one UID 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='UID'  AND a.type ='CONSUMER_ANONYM'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrAnonymWithMoreThanOneUID.tmp
					 
# get number of active registered accounts having exactly one MOBILE_APP 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)=1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrWithOneMOBILE_APP.tmp
					 
# get number of active registered accounts having more than one MOBILE_APP 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrWithMoreThanOneMOBILE_APP.tmp
					 
# get number of active anonym accounts having exactly one MOBILE_APP 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_ANONYM'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)=1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrActiveAnonymWitheOneMobileApp.tmp
					 
# get number of active anonym accounts having more than one MOBILE_APP 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_ANONYM'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrActiveAnonymWithMoreThanOneMobileApp.tmp
					 
# get number of active registered accounts having exactly one CREDITCARD 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='CREDITCARD'  AND a.type ='CONSUMER_WITH_LOGIN'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)=1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrActiveWithOneCREDITCARD.tmp
					 
# get number of active registered accounts having more than one CREDITCARD 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='CREDITCARD'  AND a.type ='CONSUMER_WITH_LOGIN'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrActiveWithMoreThanOneCREDITCARD.tmp
					 
# get number of active anonym accounts having exactly one CREDITCARD 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='CREDITCARD'  AND a.type ='CONSUMER_ANONYM'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)=1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrAnonymWithOneCREDITCARD.tmp
					 
# get number of active anonym accounts having more than one CREDITCARD 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='CREDITCARD'  AND a.type ='CONSUMER_ANONYM'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrAnonymWithMoreThanOneCREDITCARD.tmp
					 
# get number of active loyalty accounts having exactly one COUPON_LOYALTY 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='COUPON_LOYALTY'  AND a.type ='LOYALTY'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)=1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrWithOneCOUPON_LOYALTY.tmp
					 
# get number of active LOYALTY accounts having more than one COUPON_LOYALTY 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='COUPON_LOYALTY'  AND a.type ='LOYALTY'
                     GROUP BY aa.mediatype, a.id
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype) uid_login" -o nbrWithMoreThanOneCOUPON_LOYALTY.tmp
					 
# get total number of active  accounts with uid devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='UID'  AND (a.type ='CONSUMER_WITH_LOGIN' or a.type ='CONSUMER_ANONYM' )
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) uid_login" -o totalnbrActiveUID.tmp
					 
# get total number of active  accounts with mobile app devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND (a.type ='CONSUMER_WITH_LOGIN' or a.type ='CONSUMER_ANONYM' )
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) uid_login" -o totalnbrActiveMOBILE_APP.tmp
					 
# get total number of active  accounts with credit cards devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='CREDITCARD'  AND (a.type ='CONSUMER_WITH_LOGIN' or a.type ='CONSUMER_ANONYM' )
                     GROUP BY aa.mediatype, a.id
                     ORDER BY a.id, aa.mediatype) uid_login" -o totalnbrActiveCREDITCARD.tmp
					 
					 
# get total number of active  accounts without mentioning the devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, extract(epoch FROM now()), COUNT(a)
                     FROM account a
                     WHERE a.state = 'ACTIVE' 
                     GROUP BY a.id
                     ORDER BY a.id DESC ) uid_login" -o totalnbrActiveWithoutDevices.tmp
					 
# get total number of active registered  accounts without mentioning the devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, extract(epoch FROM now()), COUNT(a)
                     FROM account a
                     WHERE a.state = 'ACTIVE' AND    (a.type ='CONSUMER_WITH_LOGIN')
                     GROUP BY a.id
                     ORDER BY a.id DESC ) uid_login" -o totalnbrActiveRegisteredWithoutDevices.tmp
					 
# get total number of active anonymous  accounts without mentioning the devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, extract(epoch FROM now()), COUNT(a)
                     FROM account a
                     WHERE a.state = 'ACTIVE' AND  a.type ='CONSUMER_ANONYM'
                     GROUP BY a.id
                     ORDER BY a.id DESC ) uid_login" -o totalnbrActiveANONYMWithoutDevices.tmp

# get total number of active loyalty  accounts without mentioning the devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, extract(epoch FROM now()), COUNT(a)
                     FROM account a
                     WHERE a.state = 'ACTIVE' AND  a.type ='LOYALTY'
                     GROUP BY a.id
                     ORDER BY a.id DESC ) uid_login" -o totalnbrActiveLOYALTYWithoutDevices.tmp						 
					 
# get total number of active anonymous and registered accounts using iphone devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND (a.type ='CONSUMER_WITH_LOGIN' or a.type ='CONSUMER_ANONYM' ) and aa.description LIKE 'i%'
GROUP BY aa.mediatype, a.id,a.type,aa.description
ORDER BY a.id, aa.mediatype)iphone" -o totalnbrIphoneDevices.tmp

# get total number of active anonymous and registered accounts using android devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND (a.type ='CONSUMER_WITH_LOGIN' or a.type ='CONSUMER_ANONYM' ) and aa.description LIKE 'SM-G950F%'
GROUP BY aa.mediatype, a.id,a.type,aa.description
ORDER BY a.id, aa.mediatype)android" -o totalnbrAndroidDevices.tmp


# get total number of active registered accounts using iphone devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN' and aa.description LIKE 'i%'
                     GROUP BY aa.mediatype, a.id,a.type,aa.description
                     ORDER BY a.id, aa.mediatype)iphone" -o totalnbrregisteredIphoneDevices.tmp
					 
					 
# get total number of active anonymous  accounts using android devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND  a.type ='CONSUMER_ANONYM' and aa.description LIKE 'SM-G950F%'
                     GROUP BY aa.mediatype, a.id,a.type,aa.description
                     ORDER BY a.id, aa.mediatype)android" -o totalnbrAnonymAndroidDevices.tmp
					 
# get total number of active registered accounts using more than one iphone devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN' and aa.description LIKE 'i%'
                     GROUP BY aa.mediatype, a.id,a.type,aa.description
                     HAVING COUNT(aa)>1
                     ORDER BY a.id, aa.mediatype)iphone" -o totalnbrregisteredMoreThanOneIphoneDevices.tmp
					 
					 
# get total number of active registered accounts using android devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN' and aa.description LIKE 'SM-G950F%'
                     GROUP BY aa.mediatype, a.id,a.type,aa.description
                     ORDER BY a.id, aa.mediatype) registeredandroid" -o totalnbrregisteredAndroidDevices.tmp 
					 
# get total number of active anonym accounts using android devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN' and aa.description LIKE 'SM-G950F%'
                     GROUP BY aa.mediatype, a.id,a.type,aa.description
                     ORDER BY a.id, aa.mediatype) registeredandroid" -o totalnbranonyAndroidDevices.tmp 
					 
# get total number of active anonym accounts using iphone devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,a.type,aa.description,extract(epoch FROM now()), COUNT(distinct aa)
                     FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
                     WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND aa.mediatype='MOBILE_APP'  AND a.type ='CONSUMER_WITH_LOGIN' and aa.description LIKE 'SM-G950F%'
                     GROUP BY aa.mediatype, a.id,a.type,aa.description
                     ORDER BY a.id, aa.mediatype) registeredandroid" -o totalnbranonymIphoneDevices.tmp 
					 
# get total number of active ios devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
from accountauthority aa
where aa.state ='ACTIVE' and aa.description like '%iOS%')ios" -o totalnbrIOSDevices.tmp
					 
# get total number of active android devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
from accountauthority aa
where aa.state ='ACTIVE' and aa.description like '%Android%')android" -o totalnbrAndroidDevices.tmp

# get total number of active uid devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%UID%')uid" -o totalnbrUIDDevices.tmp
					 
# get total number of active coupon loyalties-----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%Microsoft%')coupon" -o totalnbrCouponLoyaltyDevices.tmp	

# get total number of active uid of type Mifare  -------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%MIFARE%')MIFARE" -o totalnbrMifareClassicDevices.tmp

# get total number of active uid of type Mifare classic -----------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%Classic%')Classic" -o totalnbrClassicDevices.tmp

# get total number of active uid of type Mifare Ultralight -------------------------------------------------------------------------------------\r devices 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%Ultralight%')Ultralight" -o totalnbrUltralightDevices.tmp
# get total number of active uid of type Mifare DESFire ----------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%DESFire%')DESFire" -o totalnbrDESFireDevices.tmp

# get total number of active uid of type Mifare Plus --------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%MIFARE Plus%')Plus" -o totalnbrPlusDevices.tmp	

# get total number of active uid of type Legic -------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%LEGIC%')LEGIC" -o totalnbrLEGICDevices.tmp

# get total number of active uid of type Legic Prime---------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%LEGIC prime%')LEGICprime" -o totalnbrLEGICprimeDevices.tmp	

# get total number of active uid of type LEGIC advant--------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%LEGIC advant%')LEGICadvant" -o totalnbrLEGICadvantDevices.tmp

# get total number of active uid of type ISO-14443 A Medium--------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%ISO-14443 A Medium%')ISOAMedium" -o totalnbrAMediumDevices.tmp

# get total number of active uid of type ISO-14443 B Medium--------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%ISO-14443 B Medium%')ISOBMedium" -o totalnbrBMediumDevices.tmp

# get total number of active uid of type ISO-15693 Medium--------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%ISO-15693 Medium%')ISOBMedium" -o totalnbrISO15693MediumDevices.tmp		

# get total number of active uid of type ISO-15693 legic advant--------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%ISO-14443 A, LEGIC advant%')ISOBMedium" -o totalnbrISO14443ALEGICadvantDevices.tmp	

# get total number of active uid of type ISO-15693, LEGIC advant--------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%ISO-15693, LEGIC advant%')ISOBMedium" -o totalnbrISO15693LEGICadvantDevices.tmp	

# get total number of active uid of type HID iClass---------------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%HID iClass%')HIDiClass" -o totalnbrHIDiClassDevices.tmp	

# get total number of active uid of type Calypso B Prime----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%Calypso B Prime%')HIDiClass" -o totalnbrCalypsoBPrimeDevices.tmp	

# get total number of active uid of type Sony Felica----------------------------------------------------------------------------------------------------\r devices
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (select *
                     from accountauthority aa
                     where aa.state ='ACTIVE' and aa.description like '%Sony Felica%')HIDiClass" -o totalnSonyFelicaDevices.tmp	

# get number of active registered accounts with mobile App,UID and CREDITCARD 
psql -U postgres -h evending-prod1.cisgxajymdp2.eu-west-1.rds.amazonaws.com -d evending -p 5432 -c "select count(*)FROM (SELECT a.id, aa.mediatype,extract(epoch FROM now()), COUNT(aa)
FROM account a INNER JOIN accountauthority aa ON aa.account_id = a.id
WHERE a.state = 'ACTIVE' AND aa.state = 'ACTIVE' AND (aa.mediatype='MOBILE_APP' OR aa.mediatype='CREDITCARD' OR aa.mediatype='UID' ) AND a.type ='CONSUMER_WITH_LOGIN'
GROUP BY aa.mediatype, a.id
ORDER BY a.id, aa.mediatype) mobile_login" -o nbrActiveRegisteredMobileAppANDuidANDCredicard.tmp					 
					 

# read some input from the shell to keep the shell open to see the output when the script is run 

if [ -e $OUTPUTFILE ] 
then 
	rm -rf $OUTPUTFILE
fi
echo -e "Number of accounts with devices : uid , mobile app ,creditcard ,coupon_loyalty or erf code 
 as of $DATE\r" >> $OUTPUTFILE 
echo -e "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active Accounts with Mobile Apps-------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "Total Number of active accounts with MOBILE_APP :" >> $OUTPUTFILE 
cat totalnbrActiveMOBILE_APP.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with mobile App :" >> $OUTPUTFILE 
cat nbrActiveRegisteredMobileApp.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with exactly one mobile App :" >> $OUTPUTFILE 
cat nbrWithOneMOBILE_APP.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with more than one mobile App :" >> $OUTPUTFILE 
cat nbrWithMoreThanOneMOBILE_APP.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts with mobile App :" >> $OUTPUTFILE 
cat nbrActiveAnonymMobileApp.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts with one mobile App :" >> $OUTPUTFILE 
cat nbrActiveAnonymWitheOneMobileApp.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts with more than one mobile App :" >> $OUTPUTFILE 
cat nbrActiveAnonymWithMoreThanOneMobileApp.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active iOS and Android mobile APP devices------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active different types of iOS mobile APP devices :" >> $OUTPUTFILE 
cat totalnbrIOSDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active different types of Android mobile APP devices :" >> $OUTPUTFILE 
cat totalnbrAndroidDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active UID devices-----------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active different types of UID devices :" >> $OUTPUTFILE 
cat totalnbrUIDDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active UID of type Mifare ----------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type Mifare:" >> $OUTPUTFILE 
cat totalnbrMifareClassicDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type Mifare Classic:" >> $OUTPUTFILE 
cat totalnbrClassicDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type Mifare Ultralight:" >> $OUTPUTFILE 
cat totalnbrUltralightDevices.tmp | sed -n '3p' >> $OUTPUTFILE  
echo -e "\r" >> $OUTPUTFILE
echo -e "active UID of type Mifare DESFire:" >> $OUTPUTFILE 
cat totalnbrDESFireDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE
echo -e "active UID of type Mifare Plus:" >> $OUTPUTFILE 
cat totalnbrPlusDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active UID of type Legic ----------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type Legic:" >> $OUTPUTFILE 
cat totalnbrLEGICDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type Legic Prime:" >> $OUTPUTFILE 
cat totalnbrLEGICprimeDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type ISO14443 A LEGIC,advant:" >> $OUTPUTFILE 
cat totalnbrISO14443ALEGICadvantDevices.tmp | sed -n '3p' >> $OUTPUTFILE  
echo -e "\r" >> $OUTPUTFILE
echo -e "active UID of type ISO15693 LEGIC advant:" >> $OUTPUTFILE 
cat totalnbrISO15693LEGICadvantDevices.tmp | sed -n '3p' >> $OUTPUTFILE  
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE  

echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active UID of type ISO-14443 ------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type ISO-14443 A Medium:" >> $OUTPUTFILE 
cat totalnbrAMediumDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "active UID of type ISO-14443 B Medium:" >> $OUTPUTFILE  
cat totalnbrBMediumDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active UID of type ISO-15693 Medium ----------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "active UID of type ISO-15693 Medium :" >> $OUTPUTFILE 
cat totalnbrISO15693MediumDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE
echo -e "-------------------------------Number of active UID of type HID iClass ----------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "active UID of type IHID iClass :" >> $OUTPUTFILE 
cat totalnbrHIDiClassDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active UID of type Calypso B Prime------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "active UID of type Calypso B Prime :" >> $OUTPUTFILE 
cat totalnbrCalypsoBPrimeDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE
echo -e "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "-------------------------------Number of active UID of type Sony Felica----------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "active UID of type Sony Felica :" >> $OUTPUTFILE 
cat totalnSonyFelicaDevices.tmp | sed -n '3p' >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "------------------------------Number of active Accounts with uid Devices----------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 



echo -e "Total Number of active accounts with UID:" >> $OUTPUTFILE 
cat totalnbrActiveUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with UID :" >> $OUTPUTFILE 
cat nbrActiveRegisteredUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with exactly one UID :" >> $OUTPUTFILE 
cat nbrUIDWithOneUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with more than one UID :" >> $OUTPUTFILE 
cat nbrUIDWithMoreThanOneUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts with UID :" >> $OUTPUTFILE 
cat nbrActiveAnonymUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of active anonym accounts with exactly one UID :" >> $OUTPUTFILE 
cat nbrAnonymWithOneUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE  
echo -e "Number of active anonym accounts with more than one UID :" >> $OUTPUTFILE 
cat nbrAnonymWithMoreThanOneUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 


echo -e "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active coupon loyalty devices------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active coupon loyalty devices :" >> $OUTPUTFILE 
cat totalnbrCouponLoyaltyDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "------------------------------Number of active login,anonym and loyalty Accounts with devices ------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 


echo -e "Total Number of active  accounts :" >> $OUTPUTFILE 
cat nbrActiveAccountsWithDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of active registered accounts :" >> $OUTPUTFILE 
cat nbrActiveRegisteredAccounts.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts:" >> $OUTPUTFILE 
cat nbrActiveAnonymAccounts.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active loyalty accounts :" >> $OUTPUTFILE 
cat nbrActiveLoyaltyAccounts.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active Accounts without taking the devices into account----------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "Number of active registered ,anonymous and loyalty accounts :" >> $OUTPUTFILE 
cat totalnbrActiveWithoutDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered  accounts :" >> $OUTPUTFILE 
cat totalnbrActiveRegisteredWithoutDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonymous accounts :" >> $OUTPUTFILE 
cat totalnbrActiveANONYMWithoutDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active loyalty accounts :" >> $OUTPUTFILE 
cat totalnbrActiveLOYALTYWithoutDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "--------------------------------Number of active Accounts with Credit Cards-----------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "Total Number of active accounts with CREDITCARD :" >> $OUTPUTFILE 
cat totalnbrActiveCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts with creditcard :" >> $OUTPUTFILE 
cat nbrActiveAnonymCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts with exactly one creditcard :" >> $OUTPUTFILE 
cat nbrAnonymWithOneCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active anonym accounts with more than one creditcard :" >> $OUTPUTFILE 
cat nbrAnonymWithMoreThanOneCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with creditcard :" >> $OUTPUTFILE 
cat nbrActiveRegisteredCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with exactly one creditcard :" >> $OUTPUTFILE 
cat nbrActiveWithOneCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of active registered accounts with more than one creditcard :" >> $OUTPUTFILE 
cat nbrActiveWithMoreThanOneCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 

echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-------------------------------Number of active Accounts with Coupon loyalties----------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 

echo -e "Number of active loyalty accounts with COUPON_LOYALTY :" >> $OUTPUTFILE 
cat nbrActiveRegisteredCOUPON_LOYALTY.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of active loyalty accounts with exactly one COUPON_LOYALTY :" >> $OUTPUTFILE 
cat nbrWithOneCOUPON_LOYALTY.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE  
echo -e "Number of active loyalty accounts with more than one COUPON_LOYALTY :" >> $OUTPUTFILE 
cat nbrWithMoreThanOneCOUPON_LOYALTY.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE  
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "-----------------------------Number of Deleted and inactive accounts--------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE

echo -e "Number of inactive accounts  :" >> $OUTPUTFILE 
cat nbrInActiveAccountsWithDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of deleded accounts  :" >> $OUTPUTFILE 
cat nbrDELETEDAccountsWithDevices.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of deleded accounts with UID :" >> $OUTPUTFILE 
cat nbrDeletedAccountsWithUID.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 
echo -e "Number of deleded accounts with Mobile APP :" >> $OUTPUTFILE 
cat nbrDeletedAccountsWithMOBILE_APP.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of deleded accounts with CREDIT CARD:" >> $OUTPUTFILE 
cat nbrDeletedAccountsWithCREDITCARD.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of deleded accounts with COUPON_LOYALTY :" >> $OUTPUTFILE 
cat nbrDeletedAccountsWithCOUPON_LOYALTY.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "Number of deleded accounts with EFR_CODE :" >> $OUTPUTFILE 
cat nbrDeletedAccountsWithEFR_CODE.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 
echo -e "\r" >> $OUTPUTFILE 
echo -e "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------\r" >> $OUTPUTFILE 

echo -e "Number of registered accounts with mobile app, uid or credicard  :" >> $OUTPUTFILE 
cat nbrActiveRegisteredMobileAppANDuidANDCredicard.tmp | sed -n '3p' >> $OUTPUTFILE
echo -e "\r" >> $OUTPUTFILE 

echo -e "\r" >> $OUTPUTFILE 
rm *.tmp



