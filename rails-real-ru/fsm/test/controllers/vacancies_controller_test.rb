# frozen_string_literal: true

require 'test_helper'

class VacanciesControllerTest < ActionDispatch::IntegrationTest
  test 'publish on moderate' do
    vacancy = vacancies(:on_moderate)

    patch publish_vacancy_path(vacancy)

    assert_response :redirect

    vacancy.reload
    assert { vacancy.published? }
  end

  test 'archive on moderate' do
    vacancy = vacancies(:on_moderate)

    patch archive_vacancy_path(vacancy)

    assert_response :redirect

    vacancy.reload

    assert { vacancy.archived? }
  end

  test 'archive published' do
    vacancy = vacancies(:published)

    patch archive_vacancy_path(vacancy)

    assert_response :redirect

    vacancy.reload

    assert { vacancy.archived? }
  end

  test 'refute publish archived' do
    vacancy = vacancies(:archived)

    patch publish_vacancy_path(vacancy)

    vacancy.reload

    assert { vacancy.archived? }
  end
end
