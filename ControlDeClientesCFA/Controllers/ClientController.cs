using ControlDeClientesCFA.Data;
using ControlDeClientesCFA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ControlDeClientesCFA.Controllers
{
    public class ClientController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<Client> Get()
        {
            return ClientData.ShowClients();
        }

        // GET api/<controller>/5
        public Client Get(long id)
        {
            return ClientData.GetClient(id);
        }

        // GET api/<controller>/name
        public IEnumerable<Client> Get(string name)
        {
            return ClientData.GetClient(name);
        }

        // GET api/<controller>/birthDate
        public IEnumerable<ClientBirthDate> Get(DateTime minDate, DateTime maxDate)
        {
            return ClientData.GetClient(minDate, maxDate);
        }

        // POST api/<controller>
        public string Post([FromBody] Client client)
        {
            string msg;

            bool allowedLength = Validation.MaxCharacterLengthValidation(client);
            bool allowedIdDocument = Validation.IdDocumentValidation(client);

            if (allowedLength == true && allowedIdDocument == true)
            {
                return msg = ClientData.AddNewClient(client);
            }
            else
            {
                return msg = "Registro fallido";
            }
        }

        // PUT api/<controller>
        public string Put([FromBody] Client client)
        {
            return ClientData.EditClient(client);
        }

        // DELETE api/<controller>/5
        public string Delete(long id)
        {
            return ClientData.DeleteClient(id);
        }
    }
}