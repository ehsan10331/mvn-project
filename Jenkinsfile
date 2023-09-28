// pipeline{
//   agent any
//   stages{
//     stage("maven build"){
//       steps{
//         sh "mvn clean package"
//       }
//     }
//     stage("deploy to dev"){
//       steps{
//         sshPublisher(publishers: [sshPublisherDesc(configName: 'web-server-tomcat', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''/opt/tomcat9/bin/shutdown.sh
// /opt/tomcat9/bin/startup.sh''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'wenapps', remoteDirectorySDF: false, removePrefix: 'target', sourceFiles: 'target/mvn-project.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
//       }
//     }
//   }
// }
