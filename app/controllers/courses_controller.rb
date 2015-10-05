class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def course_content
    # render json: {"course_id":1, "course_name":"test", "chapters": [{"id":47, "parent_id":0, "name":"Chapter 1", "version_id":8, "created_at":"2015-09-23T06:55:03.991Z", "updated_at":"2015-09-23T06:55:03.991Z", "course_order":0, "chapter_order":7340032, "content":false,
    #   "sections":[{"id":74, 'section_type':'text',"parent_id":47, "name":"Document: test", "version_id":8, "created_at":"2015-09-29T07:36:44.724Z", "updated_at":"2015-09-29T07:36:44.724Z", "course_order":4194304, "chapter_order":0, "content":true}, {"id":76, 'section_type':'assignment', "parent_id":47, "name":"Assessment: Test 1", "version_id":8, "created_at":"2015-09-29T08:42:52.736Z", "updated_at":"2015-09-29T08:42:52.736Z", "course_order":4194304, "chapter_order":4194304, "content":true}, {"id":79, "parent_id":47, "name":"test", "version_id":8, "created_at":"2015-09-29T08:49:48.480Z", "updated_at":"2015-09-29T08:49:48.480Z", "course_order":4194304, "chapter_order":6291456, "content":false}]}, {"id":47, "parent_id":0, "name":"Chapter 1", "version_id":8, "created_at":"2015-09-23T06:55:03.991Z", "updated_at":"2015-09-23T06:55:03.991Z", "course_order":0, "chapter_order":7340032, "content":false,
    #   "sections":[{"id":74, "parent_id":47, "name":"Document: test", "version_id":8, "created_at":"2015-09-29T07:36:44.724Z", "updated_at":"2015-09-29T07:36:44.724Z", "course_order":4194304, "chapter_order":0, "content":true}, {"id":76, "parent_id":47, "name":"Assessment: Test 2", "version_id":8, "created_at":"2015-09-29T08:42:52.736Z", "updated_at":"2015-09-29T08:42:52.736Z", "course_order":4194304, "chapter_order":4194304, "content":true}, {"id":79, "parent_id":47, "name":"test", "version_id":8, "created_at":"2015-09-29T08:49:48.480Z", "updated_at":"2015-09-29T08:49:48.480Z", "course_order":4194304, "chapter_order":6291456, "content":false}]}]}

     render json: {
        "course_id":1,
        "course_name":"test",
        "chapters":[{
          "id":47,
          "parent_id":0,
          "name":"Chapter 1",
          "version_id":8,
          "created_at":"2015-09-23T06:55:03.991Z",
          "updated_at":"2015-09-23T06:55:03.991Z",
          "course_order":0,
          "chapter_order":7340032,
          "content":false,
          "sections":[{
            "id":74,
            "section_type":"text",
            "parent_id":47,
            "name":"Document: test",
            "version_id":8,
            "created_at":"2015-09-29T07:36:44.724Z",
            "updated_at":"2015-09-29T07:36:44.724Z",
            "course_order":4194304,
            "chapter_order":0,
            "content":true
          }, {
            "id":76,
            "section_type":"assignment",
            "parent_id":47,
            "name":"Assessment: Test 1",
            "version_id":8,
            "created_at":"2015-09-29T08:42:52.736Z",
            "updated_at":"2015-09-29T08:42:52.736Z",
            "course_order":4194304,
            "chapter_order":4194304,
            "content":true }, {
            "id":79,
            "section_type":"practice_test",
            "parent_id":47,
            "name":"test",
            "version_id":8,
            "created_at":"2015-09-29T08:49:48.480Z",
            "updated_at":"2015-09-29T08:49:48.480Z",
            "course_order":4194304,
            "chapter_order":6291456,
            "content":false
          }]},
          {
          "id":47,
          "parent_id":0,
          "name":"Chapter 2",
          "version_id":8,
          "created_at":"2015-09-23T06:55:03.991Z",
          "updated_at":"2015-09-23T06:55:03.991Z",
          "course_order":0,
          "chapter_order":7340032,
          "content":false,
          "sections":[{
            "id":74,
            "section_type":"text",
            "parent_id":47,
            "name":"Document: test",
            "version_id":8,
            "created_at":"2015-09-29T07:36:44.724Z",
            "updated_at":"2015-09-29T07:36:44.724Z",
            "course_order":4194304,
            "chapter_order":0,
            "content":true
          }, {
            "id":76,
            "section_type":"assessment",
            "parent_id":47,
            "name":"Assessment: Test 2",
            "version_id":8,
            "created_at":"2015-09-29T08:42:52.736Z",
            "updated_at":"2015-09-29T08:42:52.736Z",
            "course_order":4194304,
            "chapter_order":4194304,
            "content":true
          }, {
            "id":79,
            "section_type":"practice_test",
            "parent_id":47,
            "name":"test",
            "version_id":8,
            "created_at":"2015-09-29T08:49:48.480Z",
            "updated_at":"2015-09-29T08:49:48.480Z",
            "course_order":4194304,
            "chapter_order":6291456,
            "content":false
          }]
        }
      ]}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :content)
    end
end
