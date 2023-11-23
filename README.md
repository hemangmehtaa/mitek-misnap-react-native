# MiSnap React Native Implementation for iOS and Android

# Table of Contents
 - [Setup](#setup)
 - [Frequently Asked Questions (FAQs)](#frequently-asked-questions-faqs)

# Setup
  - After cloning run 'npm install' to make sure the directory/folder is initialized for react native.
  - Run 'npm start' to run the project

# Frequently Asked Questions (FAQs)

### How to integrate the MiSnap SDK using Maven?
Please follow these steps:

1. Create a Personal Access Token (PAT) on https://www.github.com.  
   Please follow [this guide](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token) to create a PAT and make sure to select the `read:packages` scope.
2. Add the following to the **project level** `settings.gradle`:
    ```groovy
    allProjects {
      repositories {
        ...
        maven {
          url = uri('https://maven.pkg.github.com/mitek-systems/misnap-android')
          credentials {
            username = 'your-github-username'
            password = 'personal-access-token' // created in Step 1.
          }
        }
      }
    }
    ```

