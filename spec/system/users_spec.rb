require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "ログインできるとき" do
      it "保存されているユーザー情報と合致すればログインできる" do
        #トップページに移動する
        visit items_path
        #トップページにログインボタンがあることを確認する
        expect(page).to have_content('ログイン')
        #ログインページへ遷移する
        visit new_user_session_path
        #正しいユーザー情報を入力する
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        #ログインボタンを押す
        find("input[name= 'commit']").click
        #トップページへ遷移することを確認する
        expect(current_path).to eq user_session_path
        #ログアウトボタンとニックネームが表示されていることを確認する
        expect(page).to have_no_content('新規登録')
        expect(page).to have_no_content('ログイン')
      end

    context "ログインできないとき" do
      it "保存されているユーザーの情報と合致しないとログインできない" do
        #トップページに移動する
        visit items_path
        #トップページにログインボタンがあることを確認する
        expect(page).to have_content('ログイン')
        #ログインページへ遷移する
        visit new_user_session_path
        #正しいユーザー情報を入力する
        fill_in 'email', with: ""
        fill_in 'password', with: ""
        #ログインボタンを押す
        find("input[name= 'commit']").click
        #ログインページへ戻らることを確認する
        expect(current_path).to eq new_user_session_path
      end
    end
end
