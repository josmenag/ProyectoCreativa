echo 'JENKINS SIMULATOR\n\n'

echo 'Starting Newman Tests'

node --version
cd api/newman
newman run Creativa.postman_collection.json -e ProyectoCreativa.postman_environment.json
cd ../

echo 'Starting RestAssured Tests'

cd rest_assured
mvn clean test
cd ../../

echo 'Starting JMeter Tests...'

cd load
jmeter -n -t examen_test_plan.jmx
cd ../