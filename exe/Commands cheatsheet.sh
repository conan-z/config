# ============================================
# Bulk renaming files
# ============================================
Test run: rename -n 's/old/new/' target-name-regex
Rename: rename -v 's/old/new/' target-name-regex

# ============================================
# Copy all files of one dir to another
# ============================================
sudo cp -ai {SOURCE/}. {DEST/}

# ============================================
# Count number of files by regex for one level
# ============================================
find . -iname {'REGEX'} -maxdepth 1 | wc -l

# ============================================
# Compare two dirs and sort output (recursively)
# ============================================
diff -qr {DIR-1} {DIR-2} | sort

# ============================================
# check what a program is processing
# ============================================
ps -ef | grep {PROGRAM NAME}

# ============================================
# check running time of a process
# ============================================
ps -p {PID} -o etime

# ============================================
# Search for word in a directory
# ============================================
grep -Ir "{STRING TO SEARCH FOR}" "{DIRECTORY TO SEARCH}"

# ============================================
# Restart printing service
# ============================================
sudo service cups restart

# ============================================
# Create Java Key Store with certificate
# ============================================
keytool -genkey -keyalg RSA -alias ${ALIAS} -keystore ${DEST_PATH}/keystore.jks -storepass ${PASS_WORD} -validity 360 -keysize 2048

# ============================================
# Run SonarQube and generate JSON reports
# ============================================
./gradlew sonarqube -Dsonar.analysis.mode=preview -Dsonar.issuesReport.html.enable=true -Dsonar.report.export.path=report.json -x test

# ============================================
# Download and run MySQL using docker
# ============================================
docker run -d -p 3306:3306 --name local-mysql -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_USER=admin -e MYSQL_PASSWORD=admin mysql:5.6
docker run -it --link local-mysql:mysql --rm mysql:5.6 sh -c 'exec mysql -h"172.17.0.2" -P"3306" -uroot -p"admin"'

# ============================================
# Download and run PostgreSQL using docker
# ============================================
docker run -d -p 5432:5432 --name local-postgres -e POSTGRES_PASSWORD=postgres postgres
