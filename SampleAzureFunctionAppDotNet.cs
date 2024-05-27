using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;

namespace FunctionApp5
{
    public static class Function1
    {
        [FunctionName("Function1")]
        public static async Task<HttpResponseMessage> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", Route = "hello/{name:alpha}")]HttpRequestMessage req, string name, TraceWriter log)
        {
            log.Info("C# HTTP trigger function processed a request.");

            // parse query parameter
     

            if (name == null)
            {
                // Get request body
                dynamic data = await req.Content.ReadAsAsync<object>();
                name = data?.name;
            }
            //return (ActionResult)new OkObjectResult("Hello " + name);
            //return (a)
            //return name;
            var response = req.CreateResponse(HttpStatusCode.OK);
            response.Content = new StringContent("Hello " + name, Encoding.UTF8, "text/plain");
            return response;
            //return response;
            //return req.CreateResponse(HttpStatusCode.OK, "Hello " + name);
            //== null
            //? req.CreateResponse(HttpStatusCode.BadRequest, "Please pass a name on the query string or in the request body")
            //: req.CreateResponse(HttpStatusCode.OK, "Hello " + name);
        }
    }
}


-------------------------

from browser Call -- https://kumar.azurewebsites.net/api/hello/kumar

returns : Hello kumar
