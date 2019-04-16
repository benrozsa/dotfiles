# Examples
# cd .../maps-business
# ./build-backend.sh com.avon.util.dataexport
# ./build-backend.sh com.avon.maps.packedbundle
# ./build-backend.sh com.avon.maps.editoffer sling:install
# ./build-backend.sh com.avon.maps.paginationplanning


build() {
  cd $1
  command="mvn clean install $2 -Dmaven.test.skip"
  eval $command
  cd ..
}

buildBundles() {
  build "$1.persistence.service" $2
  build "$1.domain" $2
  build "$1.rest" $2
}

buildBundles $1 $2
