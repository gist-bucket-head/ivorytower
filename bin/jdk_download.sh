#https://gist.github.com/P7h/9741922
#This is for Java 8!

#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####

### Shell script to download Oracle JDK / JRE / Java binaries from Oracle website using terminal / command / shell prompt using wget.
### You can download all the binaries one-shot by just giving the BASE_URL.
### Script might be useful if you need Oracle JDK on Amazon EC2 env.
### Script is updated for every JDK release.

### Features:-
# 1. Resumes a broken / interrupted [previous] download, if any.
# 2. Renames the file to a proper name with including platform info.
# 3. Downloads the following from Oracle Website with one shell invocation.
#    a. Windows 64 and 32 bit;
#    b. Linux 64 and 32 bit;
#    c. API Docs;
#    d. You can add more to the list of downloads are per your requirement.
### Another option: 
###### curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz"

#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####

## Latest JDK8 version released on 18th August, 2015: JDK8u60
BASE_URL_8=http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60

## Earlier versions: 
## v8u51 => http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51
## v8u45 => http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45
## v8u40 => http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40
## v8u31 => http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31
## v8u25 => http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25

JDK_VERSION=${BASE_URL_8: -8}

#declare -a PLATFORMS=("-windows-x64.exe" "-linux-x64.tar.gz" "-docs-all.zip" "-windows-i586.exe" "-linux-i586.tar.gz")

declare -a PLATFORMS=("-linux-x64.tar.gz" "-docs-all.zip")

cd ~/Downloads

for platform in "${PLATFORMS[@]}"
do
    wget -c -O "$JDK_VERSION$platform" --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "${BASE_URL_8}${platform}"
    ### curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "${BASE_URL_8}${platform}"
done

#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####
