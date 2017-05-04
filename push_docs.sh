# Unfortunately not as nice as godoc.org/rubydoc.info for now: https://www.pydoc.io/about/

# set up git
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

# build and commit website files
pip install pdoc
pdoc libhoney --html --html-dir=./docs

# Check out orphan gh-pages branch, get it set up correctly
git checkout --orphan gh-pages
git reset
git add docs/
git mv docs/libhoney/*.html ./
git add .gitignore
git clean -fd
git commit "Travis build: $TRAVIS_BUILD_NUMBER"
git push origin gh-pages