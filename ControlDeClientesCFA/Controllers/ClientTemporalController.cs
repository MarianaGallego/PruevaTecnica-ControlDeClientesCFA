using ControlDeClientesCFA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace ControlDeClientesCFA.Controllers
{
    public class ClientTemporalController : ApiController
    {
        static Dictionary<long, Client> _clients = new Dictionary<long, Client>();

        //GET api/client
        public IEnumerable<Client> Get()
        {
            return new List<Client>(_clients.Values);
        }

        //POST api/client
        public bool Post([FromBody] Client client)
        {
            Client clientFound;
            _clients.TryGetValue(client.IdNumber, out clientFound);

            if(clientFound == null)
            {
                _clients.Add(client.IdNumber, client);
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
