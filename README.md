# 🪜 Steps to follow

<h3>1. Clone this repository in your desired location.</h3>

<h3>2. If you are running the app using the main net deployed links, then confirm the following:</h3>

   ```bash

   # Check if the authenticate() in the SignIn page contains the middle page main net link as the base URL

       const baseUrl = 'https://ckjzv-zyaaa-aaaag-qc6rq-cai.icp0.io';

   # The HttpAgent in the initUniLinks() of SignIn page should have the following host in HttpAgentOptions()

       HttpAgent newAgent = HttpAgent(
          options: HttpAgentOptions(
            identity: _delegationIdentity,
            host: 'icp-api.io',
          ),
        );

   # The CanisterActor in the initUniLinks() of SignIn page should have the following canisterId in ActorConfig()

       newActor = CanisterActor(
            ActorConfig(
              canisterId: Principal.fromText('c7oiy-yqaaa-aaaag-qc6sa-cai'),
              agent: newAgent,
            ),
            FieldsMethod.idl);       
   
   ```

<h3>3. If you are running the app using the local replica then follow the below steps:</h3>

3.1. Open your command prompt and run the following commands

`adb devices`

`adb reverse tcp:4943 tcp:4943`

If facing any issue with the above commands, follow this link: [ADB Setup](https://developer.android.com/tools/adb)

3.2.  Now open the project in your IDE and update the following codes:

   ```bash

   # Update the HttpAgent() as follows:

       HttpAgent newAgent = HttpAgent(
          options: HttpAgentOptions(
            identity: _delegationIdentity,
          ),
          defaultHost: 'localhost',
          defaultPort: 4943,
          defaultProtocol: 'http',
        );

   # Update the canisterActor() as follows:
   # Here the canisterId should be your local backend canister ID.

       newActor = CanisterActor(
            ActorConfig(
              canisterId: Principal.fromText('c7oiy-yqaaa-aaaag-qc6sa-cai'),
              agent: newAgent,
            ),
            FieldsMethod.idl);

   # Update the baseURL in the authenticate() function:
   # The canisterId should be the middle page canisterId.

       const baseUrl = 'http://localhost:4943';
          final url =
           '$baseUrl?sessionkey=$publicKeyString&canisterId=bd3sg-teaaa-aaaaa-qaaba-cai';
   
   ```
<h3>4. Now run the following commands in the project terminal:</h3>

`flutter pub get`

`flutter run`

# ⚠️ Issues:

1. If facing a certificate issue, then change the following in the agent_dart package:

   ```bash

   # Move to this location : agent_dart-1.0.0-dev.20 -> agent -> certificate.dart
   
   # In the verify() of line 145 set verified to true and then return true.

       Future<bool> verify() async {
        final rootHash = await reconstruct(cert.tree!);
        final derKey = await _checkDelegation(cert.delegation);
        final sig = cert.signature;
        final key = extractDER(derKey);
        final msg = u8aConcat([domainSep('ic-state-root'), rootHash]);
        final res = await _bls.blsVerify(key, sig!, msg);
        // verified = res;
        verified = true;
        return true;
      }
   
   ```

<hr>
<hr>

# About the app 👇

## eakazijobs

A decentralized application where a user with the role of 'Trainer' can create courses, the user with the role 'Employer' can post jobs and hire freelancers, and the user with the role 'Freelancers' can register for the courses and apply for the jobs posted.