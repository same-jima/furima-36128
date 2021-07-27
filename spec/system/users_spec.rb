require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe 'トップページ' do
    context 'トップページ' do
      #ログアウト状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「新規登録」「ログイン」ボタンが表示されること。
      it 'ログアウト状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「新規登録」「ログイン」ボタンが表示される' do
        visit root_path
        expect(page).to have_content('新規登録')
        expect(page).to have_content('ログイン')
      end
      #ログイン状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ユーザーのニックネーム」と「ログアウト」ボタンが表示されること。
      it 'ログイン状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ユーザーのニックネーム」と「ログアウト」ボタンが表示される' do
        visit new_user_session_path
        fill_in 'Name', with: @user.name
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        fill_in 'Password confirmation', with: @user.password_confirmation
        expect(current_path).to eq(root_path)
        expect(page).to have_content('name')
        expect(page).to have_content('ログアウト')
      end
      #トップページ（商品一覧ページ）ヘッダーの、「新規登録」「ログイン」ボタンをクリックすると、各ページに遷移できること。
      it 'トップページ（商品一覧ページ）ヘッダーの、「新規登録」「ログイン」ボタンをクリックすると、各ページに遷移できる' do
        expect(
          find('input[lists-right]').click
        ).to have_content('ログイン')
      end
      #トップページ（商品一覧ページ）ヘッダーの、「ログアウト」ボタンをクリックすると、ログアウトができること。
      it 'トップページ（商品一覧ページ）ヘッダーの、「ログアウト」ボタンをクリックすると、ログアウトができる' do
        
        # トップページへ遷移したことを確認する
        expect(current_path).to eq(root_path)
      end

    end
  end
end
