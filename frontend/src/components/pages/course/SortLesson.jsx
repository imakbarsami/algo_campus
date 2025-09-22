import React, { useEffect } from 'react'
import Modal from 'react-bootstrap/Modal';
import { DragDropContext, Droppable, Draggable } from "@hello-pangea/dnd";
import {apiUrl,token} from '../../common/Config'
import {toast} from 'react-hot-toast'


const SortLesson = ({ showSortLessonModal, handleCloseSortLessonModal,lessonData,setChapters }) => {

    const [lessons, setLessons] = React.useState([]);

    const handleDragEnd = (result) => {
        if (!result.destination) return;

        const reorderedItems = Array.from(lessons);
        const [movedItem] = reorderedItems.splice(result.source.index, 1);
        reorderedItems.splice(result.destination.index, 0, movedItem);

        setLessons(reorderedItems);
        saveOrder(reorderedItems);
    };

    
    const saveOrder=async(data)=>{
       //console.log(data)
       await fetch(`${apiUrl}/sort-lessons`,{
           method:'POST',
           headers:{
               'Content-Type':'application/json',
               'Accept':'application/json',
               'Authorization':`Bearer ${token}`
           },
           body:JSON.stringify({lessons:data})
       }).then(res=>res.json())
       .then(result=>{
           if(result.status==200){
               setChapters({ type: "UPDATE_CHAPTER", payload: result.chapter })
               toast.success(result.message)
           }
       })
    }

    useEffect(()=>{
        if(lessonData){
            setLessons(lessonData)
        }
    },[lessonData])


    return (
        <>
            <Modal size='lg' show={showSortLessonModal} onHide={handleCloseSortLessonModal}>
                <Modal.Header closeButton>
                    <Modal.Title>Sort Lesson</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <DragDropContext onDragEnd={handleDragEnd} >
                        <Droppable droppableId="list">
                            {(provided) => (
                                <div {...provided.droppableProps} ref={provided.innerRef} className="space-y-2">
                                    {
                                        lessons.map((lesson, index) => (
                                            <Draggable key={lesson.id} draggableId={`${lesson.id}`} index={index}>

                                                {(provided) => (
                                                    <div
                                                        ref={provided.innerRef}
                                                        {...provided.draggableProps}
                                                        {...provided.dragHandleProps}
                                                        className="mt-2 border px-3 py-2 bg-white shadow-lg  rounded"
                                                    >

                                                        {lesson.title}
                                                    </div>
                                                )}
                                            </Draggable>
                                        ))}
                                    {provided.placeholder}
                                </div>
                            )}
                        </Droppable>
                    </DragDropContext>
                </Modal.Body>
                <Modal.Footer>
                </Modal.Footer>
            </Modal>

        </>
    )
}

export default SortLesson