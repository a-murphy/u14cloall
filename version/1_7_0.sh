#!/bin/bash -e

# Install Clojure 1.7.0
echo "================= Installing Clojure-1.7.0 ==================="
sudo wget -nv http://repo1.maven.org/maven2/org/clojure/clojure/1.7.0/clojure-1.7.0.zip
sudo unzip clojure-1.7.0.zip
mkdir -p $HOME/lib && cp clojure-1.7.0/clojure-1.7.0.jar $HOME/lib
sudo rm -rf clojure-1.7.0*

cat >/usr/local/bin/clj <<EOF
#!/bin/bash
if [[ $# -eq 0 ]]; then
  java -server -cp $HOME/lib/clojure-1.7.0.jar clojure.main
else
  java -server -cp $HOME/lib/clojure-1.7.0.jar clojure.main $1 -- "$@"
fi
EOF
sudo chmod a+x /usr/local/bin/clj
