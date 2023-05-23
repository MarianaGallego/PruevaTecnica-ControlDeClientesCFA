using ControlDeClientesCFA.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace ControlDeClientesCFA.Data
{
    public class Validation
    {
        public static void nullFieldValidation(Client client, SqlCommand command)
        {
            if (String.IsNullOrEmpty(client.SecondSurname))
            {
                command.Parameters.AddWithValue("@secondsurname", SqlDbType.VarBinary).Value = System.Data.SqlTypes.SqlBinary.Null;
            }
            else
            {
                command.Parameters.AddWithValue("@secondsurname", client.SecondSurname);
            }

            if (String.IsNullOrEmpty(client.Email))
            {
                command.Parameters.AddWithValue("@email", SqlDbType.VarBinary).Value = System.Data.SqlTypes.SqlBinary.Null;
            }
            else
            {
                if (EmailFormatValidation(client))
                {
                    command.Parameters.AddWithValue("@email", client.Email);
                }
                else
                {
                    command.Parameters.AddWithValue("@email", SqlDbType.VarBinary).Value = System.Data.SqlTypes.SqlBinary.Null;
                }
            }
        }

        public static bool MaxCharacterLengthValidation(Client client)
        {
            int clientIdLength = client.IdNumber.ToString().Length;
            int clientNameLength = client.Name.Length;
            int clientFirstSurnameLength = client.FirstSurname.Length;
            int clientSecondSurnameLength = String.IsNullOrEmpty(client.SecondSurname) ? 0 : client.SecondSurname.Length;

            if (clientIdLength <= 11 && clientNameLength <= 30 && clientFirstSurnameLength <= 30 && clientSecondSurnameLength != 0 && clientSecondSurnameLength <= 30)
            {
                return true;
            }
            else if (clientIdLength <= 11 && clientNameLength <= 30 && clientFirstSurnameLength <= 30)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool IdDocumentValidation(Client client)
        {
            DateTime birthDate = client.BirthDate;
            int clientAge = DateTime.Today.Year - birthDate.Year;

            if (DateTime.Today < birthDate.AddYears(clientAge))
            {
                --clientAge;
            }

            if (client.IdType == "RC" && clientAge >= 0 && clientAge <= 7)
            {
                return true;
            } else if (client.IdType == "TI" && clientAge >= 8 && clientAge <= 17)
            {
                return true;
            } else if (client.IdType == "CC" && clientAge >= 18)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool ExistingClientValidation(long clientId)
        {
            string query = "SELECT * FROM ClientsTable WHERE IdNumber = '" + clientId + "'";

            using (SqlConnection connection = new SqlConnection(Connection.ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        public static bool EmailFormatValidation(Client client)
        {

            string clientEmail = client.Email;

            bool correctFormat = Regex.IsMatch(clientEmail, @"\A(\w+\.?\w*\@\w+\.)(com)\Z", RegexOptions.IgnoreCase);

            return correctFormat;
        }

        //public static bool PhoneNumberFormatValidation(long phoneNumber)
        //{
        //    if (!String.IsNullOrEmpty(phoneNumber.ToString()))
        //    {
        //        if(Regex.IsMatch(phoneNumber.ToString(), @"\A[0-9]{10}\z"))
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}

        //public static bool ClientPhoneNumbersValidation(long personalPhoneNumber, long homePhoneNumber, long workPhoneNumber)
        //{
        //    if(Validation.PhoneNumberFormatValidation(personalPhoneNumber) && Validation.PhoneNumberFormatValidation(homePhoneNumber) && Validation.PhoneNumberFormatValidation(workPhoneNumber))
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}

        public static string ObtainBirthDateFormat(Client client)
        {
            string clientBirthDate = client.BirthDate.ToString();
            string date;

            if (clientBirthDate.Length == 20)
            {
                date = (client.BirthDate.ToString()).Substring(0, 8);
            }
            else if (clientBirthDate.Length == 21)
            {
                date = (client.BirthDate.ToString()).Substring(0, 9);
            }
            else
            {
                date = (client.BirthDate.ToString()).Substring(0, 10);
            }

            return date;
        } 
    }
}