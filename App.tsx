import React from 'react';

import {NativeModules, ScrollView} from 'react-native';

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

let license:String = "your mitek sdk license key here";

const App = () => (
  <ScrollView>
  <SafeAreaView style={styles.container}>
  <View style={styles.separator}>
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
  </View>
  
  <View style={styles.separator}>
  <Button
  title="Passport + NFC"
  onPress={() => {
    ReactNativeMiSnapManager.initiatePassportAndNfcWorkflow(license);}
  }
  />
  
  <Button
  title="ID + NFC"
  onPress={() => {
    ReactNativeMiSnapManager.initiateIdAndNfcWorkflow(license);}
  }
  />
  </View>
  
  <View style={styles.separator}>
  <Button
  title="Passport + NFC + Face"
  onPress={() => {
    ReactNativeMiSnapManager.initiatePassportNfcAndFaceWorkflow(license);}
  }
  />
  
  <Button
  title="ID + NFC + Face"
  onPress={() => {
    ReactNativeMiSnapManager.initiateIdNfcAndFaceWorkflow(license);}
  }
  />
  </View>
  </SafeAreaView>
  
  
  </ScrollView>
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
      marginVertical: 20,
      borderBottomColor: '#737373',
      borderBottomWidth: StyleSheet.hairlineWidth,
    },
  });
  
  export default App;