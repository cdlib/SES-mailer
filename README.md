# SES-mailer design notes

Central server
  Pro:
    + overlapping bounce - minimal but real
    + can do centralized stats on who/what is being sent
    + one place to do credential rotation
    + doesn't interfere with client app's gem dependencies
    + can hit it from cattle machines
  Con:
    - have to keep an eye on the server, maintain it
    - more code (for API wrapper)
    - have to manage set of API keys

Just a Gem:
  Pro:
    + simple
    + decentralized
  Con:
    + lots of credential sets

  note: make it easy to port

  API endpoint:

  sendEmail(apiKey, emailName, senderAddr, recipAddrs, subject, body) => { sent: true|false, reason: bouncing|complained|error }
  checkStatus(apiKey, emailAddr) => { status: new|ok|bouncing|complained }
  getStats(apiKey, startTime, endTime)  => { sent: n, permBounced: n, tempBounced: n, complained: n }

  Martin todo:
  - Try this as a graphql schema
  - Develop a db schema
  - Create the resources in the sandbox

  Brian todo:
  - Create github repo with a tiny sinatra app
  - Work on S3 traversal and parsing
