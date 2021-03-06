﻿using AutoMapper;
using System.Linq;

namespace Vidly.Core.Mappers
{
    public static class DomainToModelMapping
    {
        public static void ApplyMapping(IMapperConfigurationExpression cfg)
        {
            cfg.CreateMap<Domain.Customer, TO.CustomerTO>();

            cfg.CreateMap<Domain.Gender, TO.GenderTO>();

            cfg.CreateMap<Domain.MembershipType, TO.MembershipTypeTO>();

            cfg.CreateMap<Domain.Movie, TO.MovieTO>();

            cfg.CreateMap<Domain.Rental, TO.RentalTO>()
               .ForMember(dst => dst.MoviesId, opt => opt.MapFrom(src => src.Movies.Select(s => s.Id).ToList()));
        }
    }
}