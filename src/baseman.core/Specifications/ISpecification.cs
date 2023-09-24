namespace Baseman.Specifications;

public interface ISpecification<TRecord>
{
    Task<IQueryable<TRecord>> Query(IQueryable<TRecord> source);
}