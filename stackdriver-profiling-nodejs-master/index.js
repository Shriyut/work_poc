const http = require("http");

const serviceName = "nodejs-profiler";

require("@google-cloud/profiler").start({
    serviceContext: {
        service: serviceName,
        version: "0.0.1"
    },
    logLevel: 3,
});

const port = 8080;

var server = http.createServer((request, response) => {
    console.log("[%s:handle] Entered", serviceName);
    response.writeHead(200, {
        "Content-Type": "text/plain"
    });
    response.end("Hello Henry!");
    console.log("[%s:handle] Exited", serviceName);
});

server.listen({
    port: (process.env.PORT || port)
}, () => {
    console.log("Server on :%s", port);
});
