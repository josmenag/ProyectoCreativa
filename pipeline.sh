echo 'JENKINS SIMULATOR\n\n'

echo 'newman tests'

node --version
cd api/newman
newman run examen.postman_collection.json -e herokuexamen.postman_environment.json
cd ../../

echo 'rest assured tests'

cd api/rest_assured
mvn clean test
cd ../../

echo 'jmeter tests'

cd load
jmeter -n -t examen_test_plan.jmx
cd ../