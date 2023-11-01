import React from 'react';

import {NativeModules} from 'react-native';

import {
  StyleSheet,
  Button,
  View,
  SafeAreaView,
  Text,
  Alert,
} from 'react-native';

const {ReactNativeMiSnapManager} = NativeModules;

const Separator = () => <View style={styles.separator} />;

let license:String = 'Add your Mitek SDK license here';

const App = () => (
  <SafeAreaView style={styles.container}>
    <View>
      
      <Button
        title="Any ID"
        onPress={() => {
          ReactNativeMiSnapManager.initiateAnyIdDocumentCapture(license);}
        }
      />
      
      

      <Button
        title="Passport"
        onPress={() => {
          ReactNativeMiSnapManager.initiatePassportDocumentCapture(license);}
        }
      />

      <Button
        title="ID Front"
        onPress={() => {
          ReactNativeMiSnapManager.initiateFrontIdDocumentCapture(license);}
        }
      />

      <Button
        title="ID Back"
        onPress={() => {
          ReactNativeMiSnapManager.initiateBackIdDocumentCapture(license);}
        }
      />
      
      <Button
        title="Check Front"
        onPress={() => {
          ReactNativeMiSnapManager.initiateFrontCheckDocumentCapture(license);}
        }
      />
      
      <Button
        title="Check Back"
        onPress={() => {
          ReactNativeMiSnapManager.initiateBackCheckDocumentCapture(license);}
        }
      />

      <Button
        title="Generic"
        onPress={() => {
          ReactNativeMiSnapManager.initiateGenericDocumentCapture(license);}
        }
      />

    </View>
    
  </SafeAreaView>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    marginHorizontal: 16,
  },
  title: {
    textAlign: 'center',
    marginVertical: 8,
  },
  fixToText: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  separator: {
    marginVertical: 8,
    borderBottomColor: '#737373',
    borderBottomWidth: StyleSheet.hairlineWidth,
  },
});

export default App;