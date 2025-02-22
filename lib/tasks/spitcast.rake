# frozen_string_literal: true

namespace :spitcast do
  desc 'Update forecast from Spitcast'
  task update: %w[environment forecasts:set_batch_id] do
    include ActionView::Helpers::DateHelper

    start_time = Time.current
    Rails.logger.info 'Updating Spitcast data...'

    hydra = Typhoeus::Hydra.new(max_concurrency: @batch.concurrency)

    Spot.where.not(spitcast_id: nil).each do |spot|
      ApiRequest.new(batch: @batch, requestable: spot, service: Spitcast, hydra: hydra).get
    end

    hydra.run

    Rails.logger.info "Finished updating Spitcast data in #{distance_of_time_in_words_to_now(start_time)}"
  end
end
