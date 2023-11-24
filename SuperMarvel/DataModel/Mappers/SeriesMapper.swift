import Foundation

final class SeriesModelMapper {
    static let instance = SeriesModelMapper()
    private init() {}

    func mapToMarvelResponses(from seriesResultDTOs: [MarvelResult]?) -> [MarvelResponse] {
        return seriesResultDTOs?.compactMap { seriesResultDTO in
            mapToMarvelResponse(from: seriesResultDTO)
        } ?? []
    }

    private func mapToMarvelResponse(from seriesResultDTO: MarvelResult) -> MarvelResponse {
        return MarvelResponse(
            code: seriesResultDTO.id,
            status: seriesResultDTO.title,
            copyright: seriesResultDTO.description, attributionText: "",
            attributionHTML: "",
            etag: seriesResultDTO.thumbnail?.fullPath ?? "",
            data: mapToMarvelData(from: seriesResultDTO)
        )
    }

    private func mapToMarvelData(from seriesResultDTO: MarvelResult) -> MarvelData {
        return MarvelData(
            offset: 0,
            limit: 0,
            total: 0,
            count: 0,
            results: [seriesResultDTO]
        )
    }
}
