using ControlDeClientesCFA.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace ControlDeClientesCFA.Data
{
    public class ClientData
    {
        public static string AddNewClient(Client client)
        { 
            if (!Validation.ExistingClientValidation(client.IdNumber))
            {
                string date = Validation.ObtainBirthDateFormat(client);

                using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
                {
                    SqlCommand command = new SqlCommand("add_client", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@idtype", client.IdType);
                    command.Parameters.AddWithValue("@idnumber", client.IdNumber);
                    command.Parameters.AddWithValue("@name", client.Name);
                    command.Parameters.AddWithValue("@firstsurname", client.FirstSurname);
                    command.Parameters.AddWithValue("@gender", client.Gender);
                    command.Parameters.AddWithValue("@birthdate", date);
                    command.Parameters.AddWithValue("@homeaddress", client.HomeAddress);
                    command.Parameters.AddWithValue("@workaddress", client.WorkAddress);
                    command.Parameters.AddWithValue("@personalphonenumber", client.PersonalPhoneNumber);
                    command.Parameters.AddWithValue("@homephonenumber", client.HomePhoneNumber);
                    command.Parameters.AddWithValue("@workphonenumber", client.WorkPhoneNumber);

                    Validation.nullFieldValidation(client, command);
                    Validation.EmailFormatValidation(client);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();

                        return "Client regitered successfully";
                    }
                    catch (Exception ex)
                    {
                        return "Error";
                    }
                }
            }
            else
            {
                return "Client is already registered";
            }
                       
        }

        public static string EditClient(Client client)
        {
            using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
            {
                if (Validation.ExistingClientValidation(client.IdNumber) && Validation.IdDocumentValidation(client))
                {
                    SqlCommand command = new SqlCommand("edit_client", connection);
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@idtype", client.IdType);
                    command.Parameters.AddWithValue("@idnumber", client.IdNumber);
                    command.Parameters.AddWithValue("@birthdate", client.BirthDate);
                    command.Parameters.AddWithValue("@homeaddress", client.HomeAddress);
                    command.Parameters.AddWithValue("@workaddress", client.WorkAddress);
                    command.Parameters.AddWithValue("@personalphonenumber", client.PersonalPhoneNumber);
                    command.Parameters.AddWithValue("@homephonenumber", client.HomePhoneNumber);
                    command.Parameters.AddWithValue("@workphonenumber", client.WorkPhoneNumber);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();

                        return "Client updated";
                    }
                    catch (Exception ex)
                    {
                        return "Error";
                    }
                }
                else
                {
                    return "Client could not be updated";
                }
                
            }
        }

        //GET client con IdNumber
        public static Client GetClient(long clientId)
        {
            Client client = new Client();

            string query = "SELECT * FROM ClientsTable as ct FULL OUTER JOIN ClientContact as cc on ct.IdNumber = cc.IdNumber FULL OUTER JOIN ClientLocation as cl on cl.IdNumber = ct.IdNumber WHERE ct.IdNumber = '"+clientId+"'";

            using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                command.Parameters.AddWithValue("@idnumber", clientId);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        client = new Client()
                        {
                            Code = Convert.ToInt64(reader["Code"]),
                            IdType = reader["IdType"].ToString(),
                            IdNumber = Convert.ToInt64(reader["IdNumber"]),
                            Name = reader["Name"].ToString(),
                            FirstSurname = reader["FirstSurname"].ToString(),
                            SecondSurname = reader["SecondSurname"].ToString(),
                            Gender = reader["Gender"].ToString(),
                            BirthDate = Convert.ToDateTime(reader["BirthDate"].ToString()),
                            HomeAddress = reader["HomeAddress"].ToString(),
                            WorkAddress = reader["WorkAddress"].ToString(),
                            PersonalPhoneNumber = Convert.ToInt64(reader["PersonalPhoneNumber"]),
                            HomePhoneNumber = Convert.ToInt64(reader["HomePhoneNumber"]),
                            WorkPhoneNumber = Convert.ToInt64(reader["WorkPhoneNumber"]),
                            Email = reader["Email"].ToString()
                        };
                    }
                }

            }

            return client;
        }

        //GET clients con Name
        public static List<Client> GetClient(string clientName)
        {
            List<Client> clientsByName = new List<Client>();

            string query = "SELECT * FROM ClientsTable as ct FULL OUTER JOIN ClientContact as cc on ct.IdNumber = cc.IdNumber FULL OUTER JOIN ClientLocation as cl on cl.IdNumber = ct.IdNumber WHERE ct.Name = '"+clientName+ "' OR ct.Name LIKE '%" + clientName + "%' ORDER BY ct.Name, ct.FirstSurname, ct.SecondSurname ASC";

            using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        clientsByName.Add(new Client()
                        {
                            Code = Convert.ToInt64(reader["Code"]),
                            IdType = reader["IdType"].ToString(),
                            IdNumber = Convert.ToInt64(reader["IdNumber"]),
                            Name = reader["Name"].ToString(),
                            FirstSurname = reader["FirstSurname"].ToString(),
                            SecondSurname = reader["SecondSurname"].ToString(),
                            Gender = reader["Gender"].ToString(),
                            BirthDate = Convert.ToDateTime(reader["BirthDate"].ToString()),
                            HomeAddress = reader["HomeAddress"].ToString(),
                            WorkAddress = reader["WorkAddress"].ToString(),
                            PersonalPhoneNumber = Convert.ToInt64(reader["PersonalPhoneNumber"]),
                            HomePhoneNumber = Convert.ToInt64(reader["HomePhoneNumber"]),
                            WorkPhoneNumber = Convert.ToInt64(reader["WorkPhoneNumber"]),
                            Email = reader["Email"].ToString()
                        });
                    }
                }
            }

            return clientsByName;
        }

        //GET clients con BirthDate
        public static List<ClientBirthDate> GetClient(DateTime minBirthDate, DateTime maxBirthDate)
        {
            List<ClientBirthDate> clientsByBirthDate = new List<ClientBirthDate>();

            string query = "SELECT * FROM ClientsTable as ct FULL OUTER JOIN ClientContact as cc on ct.IdNumber = cc.IdNumber FULL OUTER JOIN ClientLocation as cl on cl.IdNumber = ct.IdNumber WHERE ct.BirthDate between '"+minBirthDate+ "' AND '" + maxBirthDate + "' ORDER BY ct.Name, ct.FirstSurname, ct.SecondSurname ASC";

            using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        clientsByBirthDate.Add(new ClientBirthDate()
                        {
                            BirthDate = Convert.ToDateTime(reader["BirthDate"].ToString()),
                            CompleteName = reader["Name"].ToString() + " " + reader["FirstSurname"].ToString() + " " + reader["SecondSurname"].ToString()
                    });
                    }
                }
            }

            return clientsByBirthDate;
        }

        public static List<Client> ShowClients()
        {
            List<Client> clientsList = new List<Client>();

            string query = "SELECT ClientsTable.Code as Code, ClientsTable.IdType as IdType, ClientsTable.IdNumber as IdNumber, ClientsTable.Name as Name, ClientsTable.FirstSurname as FirstSurname, ClientsTable.SecondSurname as SecondSurname, ClientsTable.Gender as Gender, ClientsTable.BirthDate as BirthDate, ClientsTable.Email as Email, ClientContact.PersonalPhoneNumber as PersonalPhoneNumber, ClientContact.HomePhoneNumber as HomePhoneNumber, ClientContact.WorkPhoneNumber as WorkPhoneNumber, ClientLocation.HomeAddress as HomeAddress, ClientLocation.WorkAddress as WorkAddress FROM ClientsTable FULL OUTER JOIN ClientContact on ClientsTable.IdNumber = ClientContact.IdNumber FULL OUTER JOIN ClientLocation on ClientLocation.IdNumber = ClientsTable.IdNumber";

            using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        clientsList.Add(new Client()
                        {
                            Code = Convert.ToInt64(reader["Code"]),
                            IdType = reader["IdType"].ToString(),
                            IdNumber = Convert.ToInt64(reader["IdNumber"]),
                            Name = reader["Name"].ToString(),
                            FirstSurname = reader["FirstSurname"].ToString(),
                            SecondSurname = reader["SecondSurname"].ToString(),
                            Gender = reader["Gender"].ToString(),
                            BirthDate = Convert.ToDateTime(reader["BirthDate"].ToString()),
                            HomeAddress = reader["HomeAddress"].ToString(),
                            WorkAddress = reader["WorkAddress"].ToString(),
                            PersonalPhoneNumber = Convert.ToInt64(reader["PersonalPhoneNumber"]),
                            HomePhoneNumber = Convert.ToInt64(reader["HomePhoneNumber"]),
                            WorkPhoneNumber = Convert.ToInt64(reader["WorkPhoneNumber"]),
                            Email = reader["Email"].ToString()

                        });
                    }
                }
            }

            return clientsList;
        }

        public static string DeleteClient(long clientId)
        {
            using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
            {
                if (Validation.ExistingClientValidation(clientId))
                {
                    SqlCommand command = new SqlCommand("delete_client", connection);
                    command.CommandType = System.Data.CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@idnumber", clientId);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();

                        return "Client deleted";
                    }
                    catch (Exception ex)
                    {
                        return "Error";
                    }
                }
                else
                {
                    return "Client not found";
                }
            }
        }
    }
}