﻿using System.Web.Mvc;
using Vidly.Core.BO;
using Vidly.Domain;
using Vidly.TO;

namespace Vidly.Controllers
{
    public class MoviesController : BaseController<long, MovieTO, MovieCriteriaTO>
    {
        public MoviesController()
        {
            this.DefaultBO = new MovieBO();
        }
    }
}