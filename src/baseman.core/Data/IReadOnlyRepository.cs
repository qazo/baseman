using Baseman.Specifications;

namespace Baseman.Data;

public interface IReadOnlyRepository<TRecord>
{
    Task<TRecord> SingleAsync(ISpecification<TRecord> specification, CancellationToken cancellationToken = default);
    Task<TRecord?> SingleOrDefaultAsync(ISpecification<TRecord> specification, CancellationToken cancellationToken = default);
    Task<List<TRecord>> ToListAsync(ISpecification<TRecord> specification, CancellationToken cancellationToken = default);
}